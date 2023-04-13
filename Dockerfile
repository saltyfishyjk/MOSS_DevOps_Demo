FROM node:16
COPY ./ /app
WORKDIR /app
RUN npm install && npm run build

FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf



# RUN npm install
# RUN cd node_modules ; cd tiptap-extensions ; mv node_modules node_modules_
# CMD ["npm", "run", "dev"]