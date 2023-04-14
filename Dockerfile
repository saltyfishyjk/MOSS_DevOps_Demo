FROM node:16
WORKDIR /app
COPY . .
# RUN npm install -g npm@9.6.4 && npm install && npm install --save @/api/Notify @/api/canteen @/api/comment @/api/dish && npm run build:prod
# RUN npm install && npm run dev
RUN npm install -g npm@9.6.4 \
    && npm install \ 
    && cd node_modules ; cd tiptap-extensions ; mv node_modules node_modules_ ; cd .. ; cd .. \
    && npm run build:prod


FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf



# RUN npm install
# RUN cd node_modules ; cd tiptap-extensions ; mv node_modules node_modules_
# CMD ["npm", "run", "dev"]