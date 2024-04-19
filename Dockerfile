FROM node:18

RUN mkdir -p /dockerbooking
WORKDIR /dockerbooking
COPY . .
RUN npm install
EXPOSE 3003
CMD [ "npm", "run", "dev" ]
