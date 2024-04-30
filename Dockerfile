FROM docker.io/ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    wget \
    libicu70

RUN mkdir /workdir
WORKDIR /workdir

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
RUN chmod +x ./dotnet-install.sh
RUN ./dotnet-install.sh --install-dir /workdir/.dotnet --version latest
RUN ./dotnet-install.sh --install-dir /workdir/.dotnet --channel 7.0 --version latest
RUN ./dotnet-install.sh --install-dir /workdir/.dotnet --channel 6.0 --version latest

ENV PATH="/workdir/.dotnet:${PATH}"
