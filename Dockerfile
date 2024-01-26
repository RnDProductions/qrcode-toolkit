# Use the official Node.js 16 image as the base image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and pnpm-lock.yaml to the container
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm@8.6.12

# Install project dependencies
COPY . .
RUN pnpm install

# Copy the rest of the application code to the container

# Build the Nuxt application
RUN pnpm run build

# Expose the port that the application will run on
EXPOSE 3000

# Command to run the application
CMD ["pnpm", "start"]
