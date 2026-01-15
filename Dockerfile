# =========================
# Stage 1: Dependencies
# =========================
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

# =========================
# Stage 2: Test + Build
# =========================
FROM deps AS builder
COPY . .

# Run checks INSIDE Docker
RUN npm run lint
RUN npm test -- --coverage
RUN npm run build

# =========================
# Stage 3: Runtime (small image)
# =========================
FROM node:20-alpine
WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

CMD ["node", "dist/src/index.js"]
