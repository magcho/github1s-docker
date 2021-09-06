# syntax=docker/dockerfile:1
FROM bitnami/git
RUN mkdir /ws
WORKDIR /ws
RUN git clone https://github.com/conwnet/github1s.git

FROM node:14
COPY --from=0 /ws/github1s /github1s

RUN apt update && apt upgrade -y
RUN apt install -y rsync


WORKDIR /github1s
RUN yarn && yarn build

CMD ["yarn", "serve"]
