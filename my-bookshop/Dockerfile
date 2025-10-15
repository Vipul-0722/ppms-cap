# Use an official Node.js runtime as a parent image
FROM node:18

# Install build dependencies for native modules
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies and rebuild native modules
RUN npm ci --verbose && npm rebuild

# Bundle app source
COPY . .

# Build the CDS project
RUN npx cds build

# Deploy the database
RUN npx cds deploy

# Create a non-root user with specific UID to match deployment.yaml
RUN groupadd -r -g 1001 appuser && useradd -r -u 1001 -g appuser appuser
RUN chown -R appuser:appuser /usr/src/app

# Switch to non-root user
USER 1001

# Expose the port the app runs on
EXPOSE 4004

# Define the command to run your app
CMD [ "npm", "start" ]