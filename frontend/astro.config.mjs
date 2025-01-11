// @ts-check
import {defineConfig} from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

const isProduction = process.env.NODE_ENV === 'production';

// https://astro.build/config
export default defineConfig({
  site: isProduction ? 'https://example.com' : 'http://localhost:4000',
  publicDir: 'webapp', // Set the public directory to 'webapp'
  integrations: [mdx(), sitemap()],
  build: {
    output: 'dist', // Ensure output is directed to 'dist'
    base: isProduction ? '/webapp/' : '/',
  },
  server: {
    port: 4000,
  },
});

// import { defineConfig } from 'astro/config';
// import react from '@astrojs/react';

// const isProduction = process.env.NODE_ENV === 'production';
// // https://astro.build/config
// export default defineConfig({
//   integrations: [react()],
//   build: {
//     outDir: '../priv/static/webapp',
//     base: isProduction ? '/webapp/' : '/',
//   },
//   server: {
//     port: 4000,
//   },
// });
