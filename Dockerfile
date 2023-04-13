FROM node:16
WORKDIR /app
COPY . .
RUN npm install
#RUN cd node_modules ; cd tiptap-extensions ; mv node_modules node_modules_
CMD ["npm", "run", "dev"]