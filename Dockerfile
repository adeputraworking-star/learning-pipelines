# =========================
# Stage 1: Dependencies
# =========================
FROM node:20-alpine AS deps
WORKDIR /app

ENV NODE_ENV=development

COPY package*.json ./
RUN npm ci --include=dev

# =========================
# Stage 2: Test + Build
# =========================
FROM deps AS builder
COPY . .

RUN npm run lint
RUN npm test -- --coverage
RUN npm run build

# =========================
# Stage 3: Runtime
# =========================
FROM node:20-alpine
WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

CMD ["node", "dist/src/index.js"]
