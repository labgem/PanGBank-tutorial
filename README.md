# PanGBank tutorials

## Running tutorials on Google Colab

All tutorials are available on Google Colab.

- *Acinetobacter baumannii* AMR analysis - [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/acinetobacter_baumannii/notebook.ipynb)
- *Escherichia_coli_F* AMR anlysis [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Escherichia_coli_F/notebook.ipynb)
## Running tutorials locally

All `PanGBank` tutorials require the conda environment `pangbank-tutorial`.

```bash
git clone https://github.com/labgem/PanGBank-tutorial.git
cd PanGBank-tutorial
conda create env -f environment.yaml
conda activate pangbank-tutorial
```

Then you can run `jupyter-notebook` and try all tutorials by opening a notebook (`tutorials/<tutorial_name>/notebook.ipynb`).


