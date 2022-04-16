# Build image
# Install dependencies
FROM node:17-alpine3.14 as BUILDER

WORKDIR /app
COPY src ./
COPY package.json ./
RUN npm install

# Runtime image
# Copy node_modules and package*.json files from BUILDER to minimize image size
FROM node:17-alpine3.14

WORKDIR /app
COPY --from=BUILDER /app/ ./
EXPOSE 8080
CMD npm start