# PanGBank tutorials

This repository contains runnable tutorials for [**PanGBank**](https://pangbank.genoscope.cns.fr/), a web-based platform for exploring, analyzing, and downloading pangenomes built with [PPanGGOLiN](https://github.com/labgem/PPanGGOLiN).

These notebooks walk through real analyses, from AMR gene distribution to genome projection, so you can see PanGBank in action and adapt it to your own data.


## PanGBank article use case

The best place to start is the **paper use case**, a complete end-to-end workflow used in the PanGBank publication:

> **PanGBank: a large-scale resource of precomputed microbial pangenomes built with PPanGGOLiN**
> Mainguy J *et al.* (2026)
> *bioRxiv.*
> doi: [10.64898/2026.08.05.742796](https://doi.org/10.64898/2026.08.05.742796)

### Precomputed data

The paper use case relies on precomputed data that are hosted separately from this repository. The data are automatically downloaded when running the notebook.

The dataset is available from the [Zenodo archive](https://zenodo.org/records/22081221).

> **Note:** The precomputed data are not stored in this GitHub repository and do not need to be downloaded manually when using the notebook.


### Running locally with `Google Colab`

Open the notebook directly in Google Colaboratory — no installation required:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/article_use_case/notebook.ipynb)


### Running locally with `docker`

A self-contained docker image is available to run the tutorials:

```bash
docker run -p 8888:8888 ghcr.io/labgem/pangbank-tutorial:latest pangbank-tuto article_use_case
```

A `jupyterlab` instance will then be available at [`http://localhost:8888`](http://localhost:8888).


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
jupyter-notebook tutorials/article_use_case/notebook.ipynb
```


## Other tutorials

Shorter, standalone notebooks covering focused analyses — several of these were used to build the paper use case above.

**Antimicrobial resistance analyses**: find [Regions of Genome Plasticity (RGPs)](https://ppanggolin.readthedocs.io/en/latest/user/RGP/rgpAnalyses.html) and [Spots](https://ppanggolin.readthedocs.io/en/latest/user/RGP/rgpAnalyses.html#spot-prediction) with AMR-related annotations.

| name | description | notebook |
|---|---|---|
| *Acinetobacter_nosocomialis* | End-to-end tutorial using a small pangenome. | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Acinetobacter_nosocomialis/notebook.ipynb) |

**Genome Projection**

| name | description | notebook |
|---|---|---|
| *Projection* | Augment a pangenome with AMR annotations, then project a new genome onto the annotated pangenome. | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labgem/PanGBank-tutorial/blob/main/tutorials/Projection/notebook.ipynb) |

See the `tutorials/` directory for the full list of notebooks and examples.
