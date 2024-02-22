FROM ubuntu:22.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install npm
RUN npm install -gy @dbml/cli
RUN npm install -gy @softwaretechnik/dbml-renderer
RUN nodejs --version
WORKDIR /srv
RUN sed s/this.table.settings?.headercolor/this.table.settings.headercolor/ /usr/local/lib/node_modules/@softwaretechnik/dbml-renderer/lib/renderer.js > /tmp/renderer.js
RUN cp /tmp/renderer.js /usr/local/lib/node_modules/@softwaretechnik/dbml-renderer/lib/renderer.js
COPY gen_sql.sh /

CMD ./gen_sql.sh
