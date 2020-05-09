FROM node:12

# default variables


# set working directory
WORKDIR /usr/src/app

# copy local files
COPY . .

# run
RUN \
  apt-get update && \
  apt-get install jq -y && \
  npm install && \
  mkdir /config && \
  cp ./config/config.json /config && \
  chmod +x run.sh

CMD [ "./run.sh" ]
