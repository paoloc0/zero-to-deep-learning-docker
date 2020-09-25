FROM python:3.8-slim
# Why not alpine? https://pythonspeed.com/articles/alpine-docker-python/

RUN apt update && apt-get -y install curl
RUN apt-get -y install gpg

# https://docs.conda.io/projects/conda/en/latest/user-guide/install/rpm-debian.html :
RUN curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg \
    && install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg \
    && gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806 \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list
RUN apt update && apt-get -y install conda
ENV PATH="${PATH}:/opt/conda/bin/"

RUN mkdir /zero-to-deep-learning
WORKDIR /zero-to-deep-learning
ADD full/environment.yml ./
RUN conda env create
RUN conda init bash
RUN rm -f /bin/sh && ln -s /bin/bash /bin/sh

CMD source /root/.bashrc && conda activate ztdlbook && jupyter notebook --allow-root --ip=0.0.0.0 --port=8080

