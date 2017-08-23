FROM ubuntu:14.04
ADD http://mirrors.163.com/.help/sources.list.trusty /etc/apt/sources.list

RUN apt-get update \
		&& apt-get install -y ocaml \
		&& apt-get install -y wget \
		&& cd /home \
		&& wget "http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif1.97.tar.gz" \
		&& wget "http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverifdoc1.97.tar.gz" \
    && tar -xzf proverif1.97.tar.gz \
    && tar -xzf proverifdoc1.97.tar.gz \
    && cd /home/proverif1.97 \
    && ./build \
    && rm ../proverif1.97.tar.gz ../proverifdoc1.97.tar.gz \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
