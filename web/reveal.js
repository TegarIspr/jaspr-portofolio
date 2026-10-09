// Interaksi kecil yang tidak perlu Dart: animasi muncul, penghitung angka,
// progress gulir, menu aktif, dan efek sorot/miring pada kartu.
(function () {
  var root = document.documentElement;
  root.classList.add('js');
  var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  // Penghitung angka (0 → nilai) saat statistik terlihat.
  function countUp(el) {
    var target = parseInt(el.getAttribute('data-count'), 10);
    var suffix = el.getAttribute('data-suffix') || '';
    if (reduceMotion || isNaN(target)) { el.textContent = target + suffix; return; }
    var start = null, duration = 1400;
    function step(ts) {
      if (start === null) start = ts;
      var t = Math.min((ts - start) / duration, 1);
      var eased = 1 - Math.pow(1 - t, 3);
      el.textContent = Math.round(target * eased) + suffix;
      if (t < 1) requestAnimationFrame(step);
    }
    requestAnimationFrame(step);
  }

  // Animasi muncul saat elemen masuk layar.
  var items = document.querySelectorAll('.reveal');
  if (!('IntersectionObserver' in window) || reduceMotion) {
    items.forEach(function (el) { el.classList.add('is-visible'); });
    document.querySelectorAll('[data-count]').forEach(countUp);
  } else {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        entry.target.classList.add('is-visible');
        entry.target.querySelectorAll('[data-count]').forEach(countUp);
        io.unobserve(entry.target);
      });
    }, { threshold: 0.12, rootMargin: '0px 0px -40px 0px' });
    items.forEach(function (el, i) {
      el.style.transitionDelay = (i % 4) * 70 + 'ms';
      io.observe(el);
    });
  }

  // Progress gulir, bayangan navbar, dan tautan menu yang aktif.
  var bar = document.querySelector('.scroll-progress');
  var sections = Array.prototype.slice.call(document.querySelectorAll('main section[id]'));
  function onScroll() {
    var y = window.scrollY;
    var max = document.documentElement.scrollHeight - window.innerHeight;
    root.classList.toggle('scrolled', y > 12);
    if (bar) bar.style.transform = 'scaleX(' + (max > 0 ? y / max : 0) + ')';
    var current = '';
    sections.forEach(function (s) { if (s.offsetTop - 140 <= y) current = s.id; });
    document.querySelectorAll('.nav__links a[href^="#"]:not(.btn)').forEach(function (a) {
      a.classList.toggle('is-active', a.getAttribute('href') === '#' + current);
    });
  }
  window.addEventListener('scroll', onScroll, { passive: true });
  window.addEventListener('resize', onScroll);
  onScroll();
  // Navbar dihidrasi oleh Jaspr setelah skrip ini; tandai ulang menu aktif sesudahnya.
  setTimeout(onScroll, 800);

  // Efek sorot dan miring pada kartu (hanya perangkat dengan mouse).
  if (!reduceMotion && window.matchMedia('(hover: hover)').matches) {
    document.addEventListener('pointermove', function (e) {
      var card = e.target.closest && e.target.closest('.tilt');
      if (!card) return;
      var r = card.getBoundingClientRect();
      var x = (e.clientX - r.left) / r.width, y = (e.clientY - r.top) / r.height;
      card.style.setProperty('--mx', x * 100 + '%');
      card.style.setProperty('--my', y * 100 + '%');
      card.style.transform = 'perspective(900px) rotateX(' + (0.5 - y) * 6 + 'deg) rotateY(' + (x - 0.5) * 6 + 'deg) translateY(-4px)';
    });
    document.addEventListener('pointerout', function (e) {
      var card = e.target.closest && e.target.closest('.tilt');
      if (card && !card.contains(e.relatedTarget)) card.style.transform = '';
    });

    // Cahaya hero mengikuti kursor.
    var hero = document.querySelector('.hero');
    if (hero) hero.addEventListener('pointermove', function (e) {
      var r = hero.getBoundingClientRect();
      hero.style.setProperty('--hx', ((e.clientX - r.left) / r.width) * 100 + '%');
      hero.style.setProperty('--hy', ((e.clientY - r.top) / r.height) * 100 + '%');
    });
  }
})();
