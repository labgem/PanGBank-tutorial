FROM mambaorg/micromamba:1.5.0
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /workspace

LABEL org.opencontainers.image.source=https://github.com/labgem/PanGBank-tutorial

USER root

RUN apt-get update && apt-get install -y git tini gcc && apt-get clean
RUN git clone https://github.com/labgem/PanGBank-tutorial.git

RUN micromamba install -y -n base -f PanGBank-tutorial/environment.yaml && \
    micromamba clean --all --yes

RUN micromamba run -n base pip install jupyterlab pangbank-cli
RUN micromamba run -n base pip install git+https://github.com/labgem/PPanGGOLiN.git@output_rgp_to_fams

COPY entrypoint.sh /usr/local/bin/pangbank-tuto
RUN chmod +x /usr/local/bin/pangbank-tuto

EXPOSE 8888

