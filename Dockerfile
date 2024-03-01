FROM node:18

RUN mkdir -p /dockerbooking
WORKDIR /dockerbooking
COPY . .
RUN npm install
EXPOSE 3006
CMD [ "npm", "run", "dev" ]