FROM arm32v7/node:12-stretch

# set working directory
WORKDIR /usr/src/app

# copy local files
COPY . .

# run
RUN \
  apt-get update && \
  apt-get install jq libudev-dev -y && \
  npm install && \
  chmod +x run.sh

CMD [ "./run.sh" ]

# ports and volumes
VOLUME /config

