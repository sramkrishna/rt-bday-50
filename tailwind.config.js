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
      }
    }
  },
  plugins: [],
}

