#!/usr/bin/env bash
# ============================================================
# Los Ángeles Detailing Store — Product Image Downloader
# Corré este script en tu máquina local para bajar las fotos
# reales de producto y reemplazar los placeholders SVG.
#
# Uso:
#   chmod +x download-product-images.sh
#   ./download-product-images.sh
# ============================================================

set -e
DIR="$(cd "$(dirname "$0")" && pwd)/assets/products"
mkdir -p "$DIR"

echo "Descargando imágenes de producto a $DIR ..."
echo ""

dl() {
  local url="$1"
  local out="$2"
  echo "  → $out"
  curl -fsSL --max-time 30 -o "$DIR/$out" "$url" || echo "    ⚠ Falló: $url"
}

# ──────────────────────────────────────────────
# MENZERNA — imágenes del CDN oficial
# ──────────────────────────────────────────────
echo "▸ Menzerna"
dl "https://www.menzerna.com/fileadmin/ns_theme_menzerna/Bilder/Autopolitur/Produktbilder/Produkt_freigestellt/Autopolitur_Heavy_Cut_Compound_400_IF_freigestellt_1100x1100.png" "menzerna-hcc400.png"
dl "https://www.menzerna.com/fileadmin/_processed_/9/1/csm_menzerna_MCP_2500_V1_696x396_02a9d551b8.jpg" "menzerna-mcp2500.jpg"
dl "https://www.menzerna.com/fileadmin/_processed_/b/d/csm_menzerna_SFP3800_V1_696x396_c7b61c1e20.jpg" "menzerna-sfp3800.jpg"
dl "https://www.menzerna.com/fileadmin/_processed_/b/d/csm_menzerna-Thumbnail-mit-Auto-CFP_Teaser-EN_0a94b6b282.jpg" "menzerna-cut-force-pro.jpg"
dl "https://www.menzerna.com/fileadmin/_processed_/e/0/csm_menzerna_3in1_V1_696x396_ccc80401f6.jpg" "menzerna-one-step.jpg"
dl "https://www.menzerna.com/fileadmin/ns_theme_menzerna/Bilder/Autopolitur/Produktbilder/Produkt_Hintergrund/menzerna_CSS_1100x1100.png" "menzerna-ceramic-spray.png"

echo ""
echo "▸ Vonixx (desde vonixxcostarica.com)"
# Shopify: obtené las URLs reales en vonixxcostarica.com/products/PRODUCT.json
# Ejemplo automatizado:
for SLUG in "intense" "v-mol" "blend-ceramic-carnauba-spray-wax"; do
  JSON=$(curl -fsSL --max-time 15 "https://vonixxcostarica.com/products/${SLUG}.json" 2>/dev/null || echo "{}")
  IMG=$(echo "$JSON" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['product']['images'][0]['src'])" 2>/dev/null || echo "")
  if [ -n "$IMG" ]; then
    FNAME="vonixx-${SLUG}.jpg"
    echo "  → $FNAME"
    curl -fsSL --max-time 30 -o "$DIR/$FNAME" "$IMG" || echo "    ⚠ Falló"
  else
    echo "  ⚠ No se pudo obtener JSON para $SLUG"
  fi
done

echo ""
echo "▸ Malco (desde malcoautomotive.com)"
for SLUG in "blue-blazes%E2%84%A2-all-in-one-dressing-voc" "a-l-cosmoline-remover"; do
  JSON=$(curl -fsSL --max-time 15 "https://malcoautomotive.com/products/${SLUG}.json" 2>/dev/null || echo "{}")
  IMG=$(echo "$JSON" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['product']['images'][0]['src'])" 2>/dev/null || echo "")
  if [ -n "$IMG" ]; then
    FNAME="malco-${SLUG%%-voc}.jpg"
    echo "  → $FNAME"
    curl -fsSL --max-time 30 -o "$DIR/$FNAME" "$IMG" || echo "    ⚠ Falló"
  else
    echo "  ⚠ No se pudo obtener JSON para $SLUG"
  fi
done

echo ""
echo "▸ Fireball USA"
dl "https://fireball-usa.shop/wp-content/uploads/hydro-shampoo.jpg" "fireball-hydro-shampoo.jpg"
dl "https://fireball-usa.shop/wp-content/uploads/hydro-foam.jpg" "fireball-hydro-foam.jpg"

echo ""
echo "══════════════════════════════════════════"
echo "Listo. Imágenes guardadas en: $DIR"
echo ""
echo "Después de bajar las fotos reales, actualizá el HTML:"
echo "  Reemplazá cada .svg por .jpg/.png en index.html"
echo "  Ejemplo: sed -i 's/menzerna-hcc400.svg/menzerna-hcc400.png/g' index.html"
echo ""
echo "URLs manuales si el script falla:"
echo "  Vonixx:  https://vonixxcostarica.com/collections"
echo "  Menzerna: https://www.menzerna.com/car-care/car-polish/"
echo "  Fireball: https://fireball-usa.shop/"
echo "  Malco:   https://malcoautomotive.com/"
echo "══════════════════════════════════════════"
