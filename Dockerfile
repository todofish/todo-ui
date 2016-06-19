FROM gliderlabs/alpine:3.4
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --update add python git nodejs entrykit@testing
COPY . /app
WORKDIR /app
RUN npm install --unsafe-perm; npm install -g node-static
CMD render js/app.js -- static -a 0.0.0.0 -p 8000