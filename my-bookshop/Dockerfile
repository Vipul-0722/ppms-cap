FROM node:20-slim
WORKDIR /usr/src/app

# Copy package files first
COPY package*.json ./
RUN npm install

# Copy the entire application
COPY . .

# Build the application if necessary
RUN if [ -f "cds-build" ]; then npm run build; fi

# Expose the application port
EXPOSE 4004

# Start the application
CMD [ "npm", "start" ]