const server = Bun.serve({
  port: 8080,
  async fetch(req) {
    const req_url = new URL(req.url)
    if (req_url.pathname === "/test") {
      return new Response(Bun.file("./assets/test.sh"))
    }
    return new Response("", { status: 404 })
  }
})

console.log(`Server alive on ${server.hostname}:${server.port}`)
