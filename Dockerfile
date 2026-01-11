# Use Node.js Alpine base image (includes npm for compatibility)
FROM node:alpine

# Install bun for faster dependency installation
RUN apk add --no-cache curl bash unzip && \
    curl -fsSL https://bun.sh/install | bash

# Create a non-root user and group
RUN addgroup -S nodejs && adduser -S nodejs -G nodejs

# Copy bun to a location accessible by nodejs user
RUN cp -r /root/.bun /home/nodejs/.bun && \
    chown -R nodejs:nodejs /home/nodejs/.bun

# Add bun to PATH (both root and nodejs users can access /home/nodejs/.bun/bin)
ENV PATH="/home/nodejs/.bun/bin:${PATH}"

# Create and set the working directory inside the container
WORKDIR /app

# Copy package.json and lock files to the working directory
COPY package.json package-lock.json /app/

# Install dependencies using bun (faster than npm)
RUN bun install

# Copy the entire codebase to the working directory
COPY . /app/

# Give ownership of the working directory to the non-root user
RUN chown -R nodejs:nodejs /app

# Switch to the non-root user
USER nodejs

# Expose the port your app runs on
EXPOSE 3000

# Prevent react-scripts from trying to open browser (not available in container)
ENV BROWSER=none

# Define the command to start your application
# Using bun start (faster), npm start works as fallback if needed
CMD ["bun", "start"]
