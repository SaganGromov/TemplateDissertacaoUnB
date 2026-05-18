#!/usr/bin/env bash
set -euo pipefail

readonly DEFAULT_FILENAME="thesis"
readonly COMMAND="${1:-}"
readonly FILENAME="${2:-$DEFAULT_FILENAME}"

usage() {
  cat <<'USAGE'
Usage:
  ./compile-thesis.sh compile [filename]
  ./compile-thesis.sh clean [filename]

Arguments:
  filename  Main .tex file without extension. Defaults to "thesis".
USAGE
}

require_source() {
  if [[ ! -f "$FILENAME.tex" ]]; then
    echo "Error: '$FILENAME.tex' was not found." >&2
    exit 1
  fi
}

clean_auxiliary_files() {
  find . -type f \( \
    -name '*~' \
    -o -name '*.aux' \
    -o -name '*.bbl' \
    -o -name '*.blg' \
    -o -name '*.d' \
    -o -name '*.fls' \
    -o -name '*.fdb_latexmk' \
    -o -name '*.ilg' \
    -o -name '*.ind' \
    -o -name '*.idx' \
    -o -name '*.lof' \
    -o -name '*.log' \
    -o -name '*.lot' \
    -o -name '*.nlo' \
    -o -name '*.nls' \
    -o -name '*.out' \
    -o -name '*.synctex.gz' \
    -o -name '*.toc' \
    -o -name '*-converted-to.pdf' \
  \) -delete
}

compile_thesis() {
  require_source

  echo "Compiling $FILENAME.tex..."
  pdflatex -interaction=nonstopmode "$FILENAME.tex"
  if grep -q '\\bibdata' "$FILENAME.aux"; then
    bibtex "$FILENAME.aux"
  else
    echo "Skipping BibTeX: no bibliography database declared in $FILENAME.aux"
  fi
  makeindex "$FILENAME.idx"
  makeindex "$FILENAME.nlo" -s nomencl.ist -o "$FILENAME.nls" || true
  pdflatex -interaction=nonstopmode "$FILENAME.tex"
  makeindex "$FILENAME.nlo" -s nomencl.ist -o "$FILENAME.nls" || true
  pdflatex -interaction=nonstopmode "$FILENAME.tex"
  echo "Wrote $FILENAME.pdf"
}

case "$COMMAND" in
  compile)
    compile_thesis
    ;;
  clean)
    echo "Cleaning LaTeX auxiliary files..."
    clean_auxiliary_files
    echo "Cleaning complete."
    ;;
  -h|--help|help|"")
    usage
    ;;
  *)
    echo "Error: unknown command '$COMMAND'." >&2
    usage >&2
    exit 1
    ;;
esac
