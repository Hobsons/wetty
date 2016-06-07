FROM node:0.10.38
MAINTAINER Nathan LeClaire <nathan@docker.com>

ADD . /app
WORKDIR /app
RUN npm install
RUN apt-get update
RUN apt-get install -y vim
RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd
RUN wget --quiet https://get.docker.com/builds/Linux/x86_64/docker-1.9.0 \
 && mv docker-1.9.0 /usr/bin/docker \
 && chmod +x /usr/bin/docker

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
