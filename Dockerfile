FROM rocker/r-ver:4.1.0
# install miniconda using bash
RUN apt-get update \
    && apt-get install -y wget \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh


# install miniconda
ENV PATH="/root/miniconda3/bin:$PATH"
RUN mkdir /root/.conda && bash Miniconda3-latest-Linux-x86_64.sh -b

# create conda environment
RUN conda init bash \
    && . ~/.bashrc \
    && conda create -n Tpot python=3.8.13 numpy=1.20.3 pandas=1.3.5 \
    && conda activate Tpot \
    && conda install -c conda-forge tpot
 

COPY ./main.R main.R
COPY ./Main.py Main.py
COPY ./main.sh main.sh

CMD ./main.sh
#CMD ["conda activate Tpot"]
#CMD ["conda", "run", "-n", "Tpot", "python", "Main.py"]
