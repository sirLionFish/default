/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./src/**/*.{astro,html,js,jsx,ts,tsx,vue}",
    "./public/**/*.html",
  ],
  theme: {
    extend: {
      colors: {
        brand: "#2ea44f",
         darkblack: '#000000', // Pure black
        spacepurple: '#2e026d', // Custom purple shade
        nightpurple: '#482880', // Another purple shade
      },
      backgroundImage: {
        'space-gradient': 'linear-gradient(135deg, #000000 0%, #2e026d 50%, #482880 100%)',
      },
    },
  },
  plugins: [
  ],
};
