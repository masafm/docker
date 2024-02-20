FROM node:21
COPY ./app /app
WORKDIR /app
RUN npm install
RUN npm install dd-trace --save
CMD ["node", "--require", "dd-trace/init", "index.js"]
#CMD ["npm", "start"]
