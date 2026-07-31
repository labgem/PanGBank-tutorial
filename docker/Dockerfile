FROM mambaorg/micromamba:1.5.0
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /workspace

LABEL org.opencontainers.image.source=https://github.com/labgem/PanGBank-tutorial

USER root

RUN apt-get update && apt-get install -y git git-lfs tini gcc && apt-get clean
RUN git clone https://github.com/labgem/PanGBank-tutorial.git
RUN cd PanGBank-tutorial && git lfs pull

RUN micromamba install -y -n base -f PanGBank-tutorial/environment.yaml && \
    micromamba clean --all --yes

RUN micromamba run -n base pip install jupyterlab pangbank-cli pangbank-api[sdk]==0.5.0 plotly>=6.1.1 kaleido fa2

COPY entrypoint.sh /usr/local/bin/pangbank-tuto
RUN chmod +x /usr/local/bin/pangbank-tuto

EXPOSE 8888

