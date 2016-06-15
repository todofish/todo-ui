FROM gliderlabs/alpine:3.4
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --update add python git nodejs entrykit@testing
COPY . /app
WORKDIR /app
RUN npm install --unsafe-perm
CMD render js/app.js -- python -m SimpleHTTPServer