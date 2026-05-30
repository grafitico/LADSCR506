# LADSCR506 — Los Ángeles Detailing Store CR

Sitio web de **Los Ángeles Detailing Store**, tienda especializada en detailing automotriz premium en Costa Rica. Productos profesionales para acabado tipo show car, máximo brillo y protección avanzada para autos. 🚘✨

## Stack

Sitio estático: **HTML + CSS + JS vanilla**. Sin build, sin dependencias. Listo para desplegar en cualquier CDN o hosting estático.

## Estructura

```
.
├── index.html      # Landing page (hero, beneficios, categorías, productos, proceso, nosotros, contacto)
├── styles.css      # Sistema de diseño (tema premium oscuro + dorado)
└── script.js       # Menú móvil, navegación sticky, footer dinámico
```

## Desarrollo local

Abrí `index.html` directamente en el navegador, o levantá un servidor estático:

```bash
python3 -m http.server 8000
# luego abrí http://localhost:8000
```

## Deploy

Cualquier hosting estático funciona out of the box:

- **GitHub Pages**: Settings → Pages → Deploy from branch (`main` / root).
- **Netlify / Vercel / Cloudflare Pages**: arrastrar el repo o conectar GitHub.

## Contacto del negocio

- WhatsApp: [+506 8563 8296](https://wa.me/50685638296)
- Instagram: `@losangelesdetailingcr` *(actualizar handle real)*
- Ubicación: Costa Rica · Envíos a todo el país

## Pendientes para reemplazar

- Handle real de Instagram (`index.html` → buscar `losangelesdetailingcr`).
- Imágenes reales de productos y categorías (actualmente fondos generados por CSS).
- Logos de marcas distribuidas (sección beneficios/nosotros).
- Precios e inventario si se evoluciona a catálogo o e-commerce.
