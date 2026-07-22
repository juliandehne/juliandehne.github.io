#!/usr/bin/env bash
# Build the figures first (they are standalone TikZ renders lifted from
# pub_rse_methodology), then render the beamer deck.
set -e
cd "$(dirname "$0")"
bash figures/build-figures.sh
quarto render presentation.qmd --to beamer
