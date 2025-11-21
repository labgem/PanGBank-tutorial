# PanGBank tutorials

> [!WARNING]
> Work in progress, Not ready for use

## Quick start

### Running tutorials on Google Colab

All tutorials are available on Google Colab.

### Running locally with `docker`

A self-contained docker is available to run the tutorials

```bash
docker run -p 8888:8888 ghcr.io/labgem/pangbank-tutorial:latest pangbank-tuto <tutorial_name>
```

Then a `jupyterlab` instance is available at [`http://localhost:8888`](http://localhost:8888).

### Running locally with `conda`

> [!WARNING]
> Cloning the repository requires git-lfs.
> - deb: `apt install git-lfs`
> - rmp: `dnf install git-lfs`

**Install the conda environment**
```bash
git clone https://github.com/labgem/PanGBank-tutorial.git
cd PanGBank-tutorial
conda create env -f environment.yaml
conda activate pangbank-tutorial
pip install pangbank-cli
```


Then run `jupyter-notebook` in the tutorial directory
```bash
cd tutorials/<tutorial_name> && jupyter-notebook notebook.ipynb
```

> [!WARNING]
> The notebook code expects the current working directory to be the one containing the notebook `notebook.ipynb`. Be sure to launch Jupyter in the correct directory.


## Tutorials

### Antimicrobial resistance analysis

Find [Regions of Genome Plasticity (RGPs)](https://ppanggolin.readthedocs.io/en/latest/user/RGP/rgpAnalyses.html) and [Spots](https://ppanggolin.readthedocs.io/en/latest/user/RGP/rgpAnalyses.html#spot-prediction) with AMR-related annotations.


|name|description|notebook|
|---|---|---|
|*Acinetobacter_baumannii*|Downstream analysis based on pre-computed [PPanGGOLiN](https://github.com/labgem/PPanGGOLiN) outputs.|[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Acinetobacter_baumannii/notebook.ipynb)|
|*Acinetobacter_nosocomialis*|End-to-end tutorials using a small pangenome|[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Acinetobacter_nosocomialis/notebook.ipynb)|


### Genome Projection

|name|description|notebook|
|---|---|---|
|*Projection*|Augment a pangenome with AMR annotations and then project a new genome on the annotated pangenome|[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Projection/notebook.ipynb)|
