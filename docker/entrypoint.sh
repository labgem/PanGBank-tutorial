#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: docker run -p 8888:8888 pangbank <tutorial_name>"
    exit 1
fi

TUTORIAL="$1"
TUTORIAL_DIR="/workspace/PanGBank-tutorial/tutorials/${TUTORIAL}"
NOTEBOOK="${TUTORIAL_DIR}/notebook.ipynb"

if [ ! -f "$NOTEBOOK" ]; then
    echo "Notebook not found: $NOTEBOOK"
    echo "Available tutorials:"
    ls /workspace/PanGBank-tutorial/tutorials
    exit 1
fi

echo "Launching Jupyter Lab in: $TUTORIAL_DIR"

cd "$TUTORIAL_DIR"

jupyter lab \
    --NotebookApp.default_url="/lab/tree/notebook.ipynb" \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --NotebookApp.token='' \
    --NotebookApp.password='' \
    --allow-root
