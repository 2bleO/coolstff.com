import type { Config, Context } from "https://edge.netlify.com";

export default async function handler(req: Request, context: Context): Promise<Response> {
  const url = new URL(req.url);
  const shortCode = url.pathname.replace("/go/", "");

  // TODO: look up shortCode in Neon affiliate_links table
  // TODO: log click to link_clicks table
  // TODO: redirect to original_url with affiliate params injected

  return new Response(`Link not found: ${shortCode}`, { status: 404 });
}

export const config: Config = {
  path: "/go/*",
};
