# LADSCR506 — Los Ángeles Detailing Store CR

Sitio web de **Los Ángeles Detailing Store**, tienda especializada en detailing automotriz premium en Costa Rica. Productos profesionales para acabado tipo show car, máximo brillo y protección avanzada para autos. 🚘✨

## Stack

Sitio estático: **HTML + CSS + JS vanilla**. Sin build, sin dependencias. Listo para desplegar en cualquier CDN o hosting estático.

## Estructura

```
.
├── index.html         # Landing page (hero, beneficios, categorías, servicios, productos, proceso, nosotros, contacto)
├── styles.css         # Sistema de diseño (paleta y tipografías de marca)
├── script.js          # Menú móvil, navegación sticky, footer dinámico
└── assets/
    ├── logo.svg       # Isotipo (escudo) — reemplazar con PNG/SVG oficial del manual
    └── icons.svg      # Sprite de iconografía SVG (servicios y categorías)
```

## Identidad de marca aplicada

**Paleta (manual oficial):**

| Token              | HEX       | Uso                           |
| ------------------ | --------- | ----------------------------- |
| Azul Profundo      | `#0D1B2A` | Fondo primario, dark base     |
| Azul Eléctrico     | `#2196F3` | Iconos, links, acentos        |
| Naranja Energía    | `#FF6A00` | CTAs, highlights, "DETAILING" |
| Gris Plata         | `#B0B0B0` | Acentos sutiles, (CR)         |
| Negro Carbón       | `#111111` | Texto profundo                |
| Blanco             | `#FFFFFF` | Texto sobre dark              |

**Tipografías:** Raleway (Bold/ExtraBold/Black) para títulos y CTAs · Montserrat (Regular/Medium) para body.

**Iconografía:** SVG line icons de 2.5px stroke, en azul eléctrico sobre cápsulas circulares — consistente con el manual.

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

- **Isotipo oficial:** reemplazar `assets/logo.svg` por el escudo oficial del manual (PNG/SVG con transparencia). El sitio lo usa en nav, hero, sección nosotros y footer — al sobreescribir el archivo se actualizan todas las ubicaciones.
- Handle real de Instagram (`index.html` → buscar `losangelesdetailingcr`).
- Imágenes reales de productos (actualmente iconos SVG en marco azul).
- Precios e inventario si se evoluciona a catálogo o e-commerce.
