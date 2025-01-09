// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
	site: 'https://example.com',
	integrations: [mdx(), sitemap()],
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
