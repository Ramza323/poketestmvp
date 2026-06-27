#!/usr/bin/env bash
# init.sh — Verificación del entorno antes de cada sesión de trabajo
set -euo pipefail

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
ok()   { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
fail() { echo -e "${RED}[FAIL]${NC} $1"; ERRORS=$((ERRORS+1)); }

ERRORS=0
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

echo "=========================================="
echo " Pokemon Roguelite — Verificación de entorno"
echo "=========================================="

# --- 1. Node.js ---
echo ""
echo "[ Node.js ]"
if command -v node &>/dev/null; then
  NODE_VER=$(node --version)
  MAJOR=$(echo "$NODE_VER" | sed 's/v\([0-9]*\).*/\1/')
  if [ "$MAJOR" -ge 18 ]; then
    ok "Node.js $NODE_VER"
  else
    fail "Node.js $NODE_VER detectado. Se requiere v18+"
  fi
else
  fail "Node.js no encontrado. Instalar desde https://nodejs.org"
fi

# --- 2. npm ---
if command -v npm &>/dev/null; then
  ok "npm $(npm --version)"
else
  fail "npm no encontrado"
fi

# --- 3. Archivos del harness ---
echo ""
echo "[ Archivos del harness ]"
REQUIRED_FILES=(
  "AGENTS.md" "CLAUDE.md" "CHECKPOINTS.md" "feature_list.json"
  "docs/architecture.md" "docs/conventions.md" "docs/verification.md"
  ".claude/agents/leader.md" ".claude/agents/implementer.md" ".claude/agents/reviewer.md"
  "progress/current.md" "progress/history.md"
)
for f in "${REQUIRED_FILES[@]}"; do
  if [ -f "$f" ]; then
    ok "$f"
  else
    fail "$f no encontrado"
  fi
done

# --- 4. Sprites ---
echo ""
echo "[ Assets / Sprites ]"
POKEMON_COUNT=$(find Pokemon -maxdepth 1 -name "*.png" 2>/dev/null | wc -l | tr -d ' ') || POKEMON_COUNT=0
SHINY_IN_POKEMON=$(find Pokemon -maxdepth 1 -name "*-shiny.png" 2>/dev/null | wc -l | tr -d ' ') || SHINY_IN_POKEMON=0
if [ "${POKEMON_COUNT:-0}" -gt 900 ]; then
  ok "Pokemon/ — $POKEMON_COUNT sprites (incluye ${SHINY_IN_POKEMON} shinies)"
else
  warn "Pokemon/ — $POKEMON_COUNT sprites (esperados >900)"
fi
if [ "${SHINY_IN_POKEMON:-0}" -gt 1400 ]; then
  ok "Shinies — $SHINY_IN_POKEMON sprites *-shiny.png en Pokemon/"
else
  warn "Shinies — $SHINY_IN_POKEMON sprites *-shiny.png en Pokemon/ (esperados >1400)"
fi

# --- 5. feature_list.json ---
echo ""
echo "[ Feature list ]"
if command -v node &>/dev/null && [ -f "feature_list.json" ]; then
  IN_PROGRESS=$(node -e "
    const f = require('./feature_list.json');
    const ip = f.features.filter(x => x.status === 'in_progress');
    console.log(ip.length);
  " 2>/dev/null || echo "error")
  if [ "$IN_PROGRESS" = "error" ]; then
    fail "feature_list.json tiene formato inválido"
  elif [ "$IN_PROGRESS" -gt 1 ]; then
    fail "Hay $IN_PROGRESS features en in_progress (máximo 1)"
  elif [ "$IN_PROGRESS" -eq 1 ]; then
    FEATURE_NAME=$(node -e "
      const f = require('./feature_list.json');
      const ip = f.features.find(x => x.status === 'in_progress');
      console.log(ip.id + ': ' + ip.title);
    " 2>/dev/null)
    warn "Feature en progreso: $FEATURE_NAME"
  else
    PENDING=$(node -e "
      const f = require('./feature_list.json');
      console.log(f.features.filter(x => x.status === 'pending').length);
    " 2>/dev/null)
    ok "Sin features en progreso. Pending: $PENDING"
  fi
fi

# --- 6. Tests (si el proyecto está inicializado) ---
echo ""
echo "[ Tests ]"
if [ -f "package.json" ] && [ -d "node_modules" ]; then
  if npm test --reporter=verbose 2>&1 | tail -3 | grep -q "passed\|PASS\|Tests:"; then
    ok "Suite de tests pasa"
  else
    TEST_OUT=$(npm test 2>&1 | tail -5)
    if echo "$TEST_OUT" | grep -q "no test files found\|No test files"; then
      warn "No hay tests aún (esperado en setup inicial)"
    else
      fail "Tests fallando:\n$TEST_OUT"
    fi
  fi
elif [ -f "package.json" ]; then
  warn "node_modules/ no encontrado — correr: npm install"
else
  warn "package.json no encontrado — proyecto no inicializado aún (F01 pendiente)"
fi

# --- 7. Build (si el proyecto está inicializado) ---
echo ""
echo "[ Build ]"
if [ -f "package.json" ] && [ -d "node_modules" ]; then
  if npm run build -- --silent 2>/dev/null; then
    ok "Build TypeScript exitoso"
  else
    fail "Build TypeScript falla (ver errores arriba)"
  fi
fi

# --- Resumen ---
echo ""
echo "=========================================="
if [ "$ERRORS" -eq 0 ]; then
  echo -e "${GREEN}[OK] Entorno listo${NC}"
  exit 0
else
  echo -e "${RED}[FAIL] $ERRORS error(es) encontrados. Resolver antes de continuar.${NC}"
  exit 1
fi
