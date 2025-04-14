tw:
	npx @tailwindcss/cli -i static/css/tailwind.css -o static/css/styles.css --watch

twbuild:
	npx @tailwindcss/cli -i static/css/tailwind.css -o static/css/styles.css --minify
