# PanGBank tutorials

This repository contains runnable tutorials for [**PanGBank**](https://pangbank.genoscope.cns.fr/), a web-based platform for exploring, analyzing, and downloading pangenomes built with [PPanGGOLiN](https://github.com/labgem/PPanGGOLiN).

These notebooks walk through real analyses, from AMR gene distribution to genome projection, so you can see PanGBank in action and adapt it to your own data.


## Quick start

The best place to start is the **paper use case**: the complete, end-to-end workflow used in the PanGBank publication, from a pre-computed pangenome to AMR gene analysis and genome projection.

**Google Colab:** [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/article_use_case/notebook.ipynb)

Opens the notebook directly in Google Colaboratory — no installation required.

### Running locally with `docker`

A self-contained docker image is available to run the tutorials:

```bash
docker run -p 8888:8888 ghcr.io/labgem/pangbank-tutorial:latest pangbank-tuto article_use_case
```

A `jupyterlab` instance will then be available at [`http://localhost:8888`](http://localhost:8888).

### Running locally with `conda`

> [!NOTE]
> Cloning the repository requires git-lfs.
> - deb: `apt install git-lfs`
> - rpm: `dnf install git-lfs`

**Install the conda environment**
```bash
git clone https://github.com/labgem/PanGBank-tutorial.git
cd PanGBank-tutorial
conda env create -f environment.yaml
conda activate pangbank-tutorial
pip install pangbank-cli pangbank-api[sdk]==0.5.0 plotly>=6.1.1 kaleido fa2
```

Then run `jupyter-notebook` in the tutorial directory:
```bash
cd tutorials/article_use_case/ && jupyter-notebook notebook.ipynb
```

> [!NOTE]
> The notebook code expects the current working directory to be `tutorials/article_use_case/`. Be sure to launch Jupyter from the correct directory.


## Other tutorials

Shorter, standalone notebooks covering focused analyses — several of these were used to build the paper use case above.

**Antimicrobial resistance analyses**: find [Regions of Genome Plasticity (RGPs)](https://ppanggolin.readthedocs.io/en/latest/user/RGP/rgpAnalyses.html) and [Spots](https://ppanggolin.readthedocs.io/en/latest/user/RGP/rgpAnalyses.html#spot-prediction) with AMR-related annotations.

| name | description | notebook |
|---|---|---|
| *Acinetobacter_baumannii* | Downstream analysis based on pre-computed [PPanGGOLiN](https://github.com/labgem/PPanGGOLiN) outputs. | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Acinetobacter_baumannii/notebook.ipynb) |
| *Acinetobacter_nosocomialis* | End-to-end tutorial using a small pangenome. | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Acinetobacter_nosocomialis/notebook.ipynb) |

**Genome Projection**

| name | description | notebook |
|---|---|---|
| *Projection* | Augment a pangenome with AMR annotations, then project a new genome onto the annotated pangenome. | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Projection/notebook.ipynb) |

See the `tutorials/` directory for the full list of notebooks and examples.