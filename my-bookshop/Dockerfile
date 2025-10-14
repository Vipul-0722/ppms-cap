# Filename: Dockerfile

# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Build the CDS project
RUN npx cds-build

# Expose the port the app runs on
EXPOSE 4004

# Define the command to run your app
CMD [ "npm", "start" ]
