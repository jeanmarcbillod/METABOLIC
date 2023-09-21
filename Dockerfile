# Start with a Debian base image
FROM debian

# Essential dependencies
RUN apt-get update && apt-get install -y wget bzip2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

# Add Miniconda to PATH
ENV PATH="/opt/conda/bin:${PATH}"

# Initialize conda (this integrates it with shell, so conda activate works)
RUN conda init bash

# Set the working directory
WORKDIR /app

# Copy the environment file into the container
COPY METABOLIC_v4.0_env.yml .

# Create the Conda environment
RUN conda update -n base conda && \
    conda env create -f METABOLIC_v4.0_env.yml

RUN echo "conda activate METABOLIC_v4.0" >> ~/.bashrc

ENTRYPOINT [ "/bin/bash" ]
