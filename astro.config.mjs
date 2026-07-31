// @ts-check
import { defineConfig } from 'astro/config';
import netlify from '@astrojs/netlify';

// https://astro.build/config
// Note: Astro v7 removed output: 'hybrid'. Using output: 'static' (now the default),
// which behaves identically — pages with `export const prerender = false` are
// server-rendered on demand by the Netlify adapter.
export default defineConfig({
  output: 'static',
  adapter: netlify(),
});
