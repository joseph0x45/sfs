FROM oven/bun
WORKDIR /app
COPY package.json package.json
COPY bun.lockb bun.lockb
# RUN bun build ./server.ts --outfile=server.js
COPY . .
EXPOSE 8080
ENTRYPOINT ["bun", "run", "server.js"]
