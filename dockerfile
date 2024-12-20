# Use a minimal Node.js image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json ./
COPY pnpm-lock.yaml ./

# Copy the rest of the application code
COPY . .

# Install pnpm
RUN npm install -g pnpm

# Install dependencies using pnpm
RUN pnpm install --prod

# Build the NestJS application
RUN npm run build

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "dist/main"]
