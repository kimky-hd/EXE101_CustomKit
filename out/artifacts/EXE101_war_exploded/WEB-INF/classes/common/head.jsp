<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@400;500;700;900&amp;display=swap" rel="stylesheet" />
<link
    href="https://fonts.googleapis.com/css2?family=Spline+Sans:wght@300;400;500;600;700&amp;family=Gochi+Hand&amp;display=swap"
    rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
    rel="stylesheet" />
<script id="tailwind-config">
    tailwind.config = {
        darkMode: "class",
        theme: {
            extend: {
                colors: {
                    "primary": "#d7193f",
                    "background-light": "#f8f6f6",
                    "background-dark": "#211114",
                    "doodle-black": "#1b0e10",
                    "kraft-brown": "#D2B48C",
                    "bestie-green": "#22c55e",
                    "trending-purple": "#9333ea",
                },
                fontFamily: {
                    "display": ["Spline Sans", "Epilogue", "sans-serif"],
                    "handwritten": ["Gochi Hand", "cursive"]
                },
                borderRadius: {
                    "DEFAULT": "0.25rem",
                    "lg": "0.5rem",
                    "xl": "0.75rem",
                    "full": "9999px"
                },
                boxShadow: {
                    'hard': '4px 4px 0px 0px #1b0e10',
                    'hard-lg': '8px 8px 0px 0px #1b0e10',
                }
            },
        },
    }
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />