FROM node:14.21.3
WORKDIR /usr/src/app
COPY . .
RUN npm install
EXPOSE 3003
RUN npm i -g webpack@4.1.0 webpack-cli@4.1.0
RUN npm link webpack
RUN webpack-cli
RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser
CMD [ "npm", "start" ]
