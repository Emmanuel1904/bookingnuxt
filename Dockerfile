FROM node:18

RUN mkdir -p /dockerbooking
WORKDIR /dockerbooking
COPY . .
RUN npm install
CMD [ "npm", "run", "dev" ]
