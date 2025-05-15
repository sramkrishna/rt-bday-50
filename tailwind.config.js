/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./layouts/**/*.html",
    "./themes/**/*.html",
    "./content/**/*.md"
  ],
  theme: {
    extend: {
      fontFamily: {
        cursive: ['"Great Vibes"', 'cursive'],
        serif: ['Lora', 'Georgia', 'serif'],  // Use Lora for serif utilities
      }
    }
  },
  plugins: [],
}

