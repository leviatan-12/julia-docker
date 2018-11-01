FROM ubuntu:xenial

RUN useradd -d /home/juliaUser -ms /bin/bash -g root -G sudo -p juliaUser prueba

WORKDIR /home/juliaUser

RUN apt update && apt install -y vim tmux curl

ENV JULIA_PATH /usr/local/julia
ENV PATH $JULIA_PATH/bin:$PATH

RUN curl -fL -o julia.tar.gz https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.1-linux-x86_64.tar.gz 

RUN mkdir $JULIA_PATH 
RUN tar -xzf julia.tar.gz -C $JULIA_PATH --strip-components 1 && rm julia.tar.gz && julia --version
	
COPY app app

USER juliaUser

RUN julia app/config.jl

