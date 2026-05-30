(() => {
  const nav = document.getElementById('nav');
  const toggle = document.getElementById('navToggle');
  const menu = document.getElementById('navMenu');
  const year = document.getElementById('year');

  if (year) year.textContent = new Date().getFullYear();

  if (toggle && menu) {
    toggle.addEventListener('click', () => {
      const open = menu.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', String(open));
      toggle.setAttribute('aria-label', open ? 'Cerrar menú' : 'Abrir menú');
    });

    menu.querySelectorAll('a').forEach((link) => {
      link.addEventListener('click', () => {
        menu.classList.remove('is-open');
        toggle.setAttribute('aria-expanded', 'false');
        toggle.setAttribute('aria-label', 'Abrir menú');
      });
    });
  }

  if (nav) {
    const onScroll = () => {
      if (window.scrollY > 8) nav.classList.add('is-scrolled');
      else nav.classList.remove('is-scrolled');
    };
    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();
  }

  // === Catálogo: filtros por categoría ===
  const filters = document.querySelectorAll('.filter');
  const grid = document.getElementById('catalogGrid');
  const empty = document.getElementById('catalogEmpty');

  if (filters.length && grid) {
    const cards = Array.from(grid.querySelectorAll('.pcard'));

    filters.forEach((btn) => {
      btn.addEventListener('click', () => {
        const target = btn.dataset.filter;

        filters.forEach((f) => {
          const isActive = f === btn;
          f.classList.toggle('is-active', isActive);
          f.setAttribute('aria-selected', isActive ? 'true' : 'false');
          if (isActive) f.setAttribute('aria-current', 'true');
          else f.removeAttribute('aria-current');
        });

        let visible = 0;
        cards.forEach((card) => {
          const match = target === 'all' || card.dataset.cat === target;
          card.hidden = !match;
          if (match) visible++;
        });

        if (empty) empty.hidden = visible > 0;
      });
    });
  }
})();
