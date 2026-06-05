#!/usr/bin/env bash
# Compile the LaTeX CV and place the PDF where the website serves it.
#
#   Usage:  ./scripts/build_cv.sh
#
# After running, the updated PDF is at files/CV_TrungThaiDo.pdf.
# Then publish it with:  git add files/CV_TrungThaiDo.pdf && git commit -m "Update CV" && git push

set -euo pipefail

# Run from the repo root regardless of where the script is called from.
cd "$(dirname "$0")/.."

SRC="CV_TrungThaiDo.tex"
OUT="files/CV_TrungThaiDo.pdf"

echo "==> Compiling $SRC ..."
latexmk -pdf -interaction=nonstopmode "$SRC"

echo "==> Copying PDF to $OUT ..."
cp "CV_TrungThaiDo.pdf" "$OUT"

echo "==> Cleaning LaTeX build artifacts ..."
latexmk -c >/dev/null 2>&1 || true

echo "==> Done. Updated $OUT"
echo "    Publish with: git add $OUT && git commit -m 'Update CV' && git push"
