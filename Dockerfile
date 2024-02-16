# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

ARG NODE_VERSION=19.7

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV production


# Create a new directory in root called labone
RUN mkdir /labone

# Change ownership to the node user and node group
RUN chown -R node:node /labone

# Set the new folder as the working directory
WORKDIR /labone

# Set the user to node
USER node

# Create a directory for the application with proper permissions
RUN mkdir /labone/etc && mkdir /labone/etc/todos && chown -R node:node /labone/etc

# Copy all source files and change the file ownership
COPY --chown=node:node . .

# Run npm install command to install Node.js packages
RUN npm install

# Expose port 3000
EXPOSE 3000

# Set the default execution command
CMD ["node", "src/index.js"]

