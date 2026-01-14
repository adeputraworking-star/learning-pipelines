# 1. Use official Node image
FROM node:20-alpine

# 2. Set working directory
WORKDIR /app

# 3. Copy package files first (better caching)
COPY package*.json ./

# 4. Install dependencies (clean & reproducible)
RUN npm ci

# 5. Copy source code
COPY . .

# 6. Build TypeScript
RUN npm run build

# 7. Run app
CMD ["node", "dist/src/index.js"]
