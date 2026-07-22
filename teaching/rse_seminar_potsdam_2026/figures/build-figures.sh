#!/usr/bin/env bash
# Render every fig-*.tex to a cropped standalone PDF in ../img/.
# Uses Quarto's TinyTeX; the system MiKTeX pdflatex is broken on this machine.
set -u
cd "$(dirname "$0")"

PDFLATEX="$APPDATA/TinyTeX/bin/windows/pdflatex.exe"
[ -x "$PDFLATEX" ] || PDFLATEX=pdflatex

mkdir -p ../img
rc=0
for f in fig-*.tex; do
    base="${f%.tex}"
    echo "=== $base ==="
    if "$PDFLATEX" -interaction=nonstopmode -halt-on-error \
        -output-directory=build "$f" > "build/$base.buildlog" 2>&1; then
        cp "build/$base.pdf" "../img/$base.pdf"
        echo "    ok -> ../img/$base.pdf"
    else
        echo "    FAILED (see build/$base.buildlog)"
        rc=1
    fi
done
exit $rc
