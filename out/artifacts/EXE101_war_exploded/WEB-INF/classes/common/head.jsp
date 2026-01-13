<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Papericious - Arts & Craft Supplies</title>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    'brand-pink': '#e8a6ae',
                    'brand-dark': '#333333',
                    'brand-gray': '#f4f4f4',
                    'brand-gold': '#d4af37'
                },
                fontFamily: {
                    'serif': ['"Playfair Display"', 'serif'],
                    'sans': ['"Lato"', 'sans-serif'],
                }
            }
        }
    }
</script>
<style>
    .hover-zoom-img { transition: transform 0.5s ease; }
    .group:hover .hover-zoom-img { transform: scale(1.1); }
</style>
