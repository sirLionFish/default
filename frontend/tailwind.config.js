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
        // Added blue color
        skyblue: '#1e90ff',
      },
      backgroundImage: {
        // Consolidated backgroundImage entries
        'space-gradient': 'linear-gradient(135deg, #000000 0%, #2e026d 50%, #482880 100%)',
        'sunrise-gradient': 'radial-gradient(circle at center, rgba(139, 92, 246, 0.8) 0%, rgba(139, 92, 246, 0) 70%)',
        // Added blue sunrise gradient
        'sunrise-gradient-blue': 'radial-gradient(circle at center, rgba(30, 144, 255, 0.8) 0%, rgba(30, 144, 255, 0) 70%)',
      },
      keyframes: {
        'sunrise-appear': {
          '0%': { transform: 'scale(0)', opacity: 0 },
          '100%': { transform: 'scale(1)', opacity: 1 },
        },
        // Added blue sunrise keyframes
        'sunrise-appear-blue': {
          '0%': { transform: 'scale(0)', opacity: 0 },
          '100%': { transform: 'scale(1)', opacity: 1 },
        },
      },
      animation: {
        'sunrise-appear': 'sunrise-appear 6s ease-out forwards',
        // Added blue sunrise animation
        'sunrise-appear-blue': 'sunrise-appear-blue 6s ease-out forwards',
      },
      boxShadow: {
        'glow-white-outline': '0 0 0 2px white', // White outline
        'button-glow': '0 4px 6px rgba(255, 255, 255, 0.6)', // Subtle glow
      },
    },
  },
  plugins: [],
};
