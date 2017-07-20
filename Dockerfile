FROM cgswong/min-jessie:latest
MAINTAINER Quantum <quantum@dmoj.ca>

RUN groupadd -r judge && useradd -r -g judge judge
RUN apt-get -y update && apt-get install -y --no-install-recommends python python2.7-dev python-pip python3 gcc g++ wget file vim && apt-get clean
RUN pip install --upgrade pip
RUN pip install setuptools
RUN pip install --no-cache-dir pyyaml watchdog cython ansi2html termcolor && \
    rm -rf ~/.cache


RUN mkdir -p /judge/problems

COPY . /judge
WORKDIR /judge

RUN env DMOJ_REDIST=1 python setup.py develop && rm -rf build/

ENTRYPOINT ["dmoj", "-c", "/judge/judgeconfig.yml", "testjudge.telerikacademy.com"]
EXPOSE 9000
