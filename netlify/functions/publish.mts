import type { Config, Context } from "@netlify/functions";

export default async function handler(req: Request, context: Context) {
  if (req.method !== "POST") {
    return new Response("Method Not Allowed", { status: 405 });
  }

  // TODO: authenticate request (shared secret header check)
  // TODO: parse article payload from req.json()
  // TODO: insert into Neon articles table
  // TODO: trigger Netlify deploy hook to rebuild

  return new Response(JSON.stringify({ ok: true }), {
    status: 200,
    headers: { "Content-Type": "application/json" },
  });
}

export const config: Config = {
  path: "/api/publish",
};
