// Semua konten portofolio ada di file ini.
// Ganti teks placeholder di bawah dengan data kamu sendiri, lalu build ulang.

class Profile {
  static const name = 'Kanagara';
  static const initials = 'KG';
  static const location = 'Indonesia';
  static const email = 'halo@kanagara.dev';
  static const github = 'https://github.com/TegarIspr';
  static const linkedin = 'https://www.linkedin.com/';
  static const cvUrl = '#contact';

  static const greeting = 'Halo, saya';
  static const roles = [
    'Software Developer',
    'Flutter & Dart Enthusiast',
    'Web Developer',
    'Problem Solver',
  ];
  static const tagline =
      'Saya membangun aplikasi web dan mobile yang cepat, rapi, dan menyenangkan '
      'untuk digunakan, dengan fokus pada detail dan pengalaman pengguna.';

  static const about = [
    'Saya seorang developer yang senang mengubah ide menjadi produk digital yang nyata. '
        'Sehari-hari saya banyak bekerja dengan Dart, Flutter, dan teknologi web modern.',
    'Saya percaya kode yang baik itu mudah dibaca, mudah diuji, dan memberi dampak bagi '
        'penggunanya. Di luar coding, saya suka belajar hal baru dan berbagi pengetahuan.',
  ];

  static const stats = [
    Stat('3+', 'Tahun pengalaman'),
    Stat('20+', 'Proyek selesai'),
    Stat('10+', 'Teknologi dikuasai'),
  ];

  static const skills = [
    'Dart',
    'Flutter',
    'Jaspr',
    'JavaScript',
    'TypeScript',
    'HTML & CSS',
    'Firebase',
    'REST API',
    'Git',
    'Figma',
  ];

  static const projects = [
    Project(
      title: 'Aplikasi Kasir Pintar',
      description:
          'Aplikasi point-of-sale lintas platform dengan sinkronisasi offline, laporan '
          'penjualan harian, dan pencetakan struk via Bluetooth.',
      tags: ['Flutter', 'Firebase', 'Bloc'],
      accent: 'violet',
      icon: Icons.cart,
      repoUrl: 'https://github.com/TegarIspr',
      liveUrl: '#',
    ),
    Project(
      title: 'Portofolio Jaspr',
      description:
          'Website portofolio statis yang dibangun sepenuhnya dengan Dart menggunakan '
          'Jaspr, cepat dimuat dan ramah SEO.',
      tags: ['Dart', 'Jaspr', 'CSS'],
      accent: 'cyan',
      icon: Icons.code,
      repoUrl: 'https://github.com/TegarIspr',
      liveUrl: '#',
    ),
    Project(
      title: 'Dashboard Analitik',
      description:
          'Dashboard real-time untuk memantau metrik bisnis dengan grafik interaktif, '
          'filter dinamis, dan ekspor laporan.',
      tags: ['TypeScript', 'React', 'Chart.js'],
      accent: 'pink',
      icon: Icons.chart,
      repoUrl: 'https://github.com/TegarIspr',
      liveUrl: '#',
    ),
    Project(
      title: 'Aplikasi Catatan Belajar',
      description:
          'Aplikasi catatan dengan dukungan markdown, tag, pencarian cepat, dan mode '
          'gelap untuk membantu pelajar tetap teratur.',
      tags: ['Flutter', 'SQLite', 'Riverpod'],
      accent: 'amber',
      icon: Icons.book,
      repoUrl: 'https://github.com/TegarIspr',
      liveUrl: '#',
    ),
  ];

  static const experiences = [
    Experience(
      period: '2024 — Sekarang',
      role: 'Software Developer',
      company: 'Nama Perusahaan',
      description:
          'Mengembangkan dan memelihara aplikasi mobile serta web, berkolaborasi dengan '
          'tim desain dan produk untuk merilis fitur baru setiap sprint.',
    ),
    Experience(
      period: '2023 — 2024',
      role: 'Frontend Developer (Freelance)',
      company: 'Berbagai Klien',
      description:
          'Membangun landing page, dashboard, dan aplikasi kecil untuk UMKM dengan fokus '
          'pada performa dan tampilan yang responsif.',
    ),
    Experience(
      period: '2022 — 2023',
      role: 'Mobile Developer Intern',
      company: 'Nama Startup',
      description:
          'Membantu pengembangan aplikasi Flutter, menulis unit test, dan memperbaiki '
          'bug yang dilaporkan pengguna.',
    ),
  ];
}

class Stat {
  const Stat(this.value, this.label);
  final String value;
  final String label;
}

class Project {
  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.accent,
    required this.icon,
    this.repoUrl,
    this.liveUrl,
  });

  final String title;
  final String description;
  final List<String> tags;
  final String accent;
  final String icon;
  final String? repoUrl;
  final String? liveUrl;
}

class Experience {
  const Experience({
    required this.period,
    required this.role,
    required this.company,
    required this.description,
  });

  final String period;
  final String role;
  final String company;
  final String description;
}

/// Ikon SVG inline (gaya Lucide, stroke-based).
class Icons {
  static String _svg(String body) =>
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" '
      'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">$body</svg>';

  static final github = _svg(
    '<path d="M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4"/><path d="M9 18c-4.51 2-5-2-7-2"/>',
  );
  static final linkedin = _svg(
    '<path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"/><rect width="4" height="12" x="2" y="9"/><circle cx="4" cy="4" r="2"/>',
  );
  static final mail = _svg(
    '<rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>',
  );
  static final external = _svg(
    '<path d="M15 3h6v6"/><path d="M10 14 21 3"/><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/>',
  );
  static final arrowRight = _svg('<path d="M5 12h14"/><path d="m12 5 7 7-7 7"/>');
  static final mapPin = _svg(
    '<path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/>',
  );

  // Ikon proyek disimpan sebagai nama agar bisa dipakai di const Project.
  static const cart = 'cart';
  static const code = 'code';
  static const chart = 'chart';
  static const book = 'book';

  static String byName(String name) => switch (name) {
    cart => _svg(
      '<circle cx="8" cy="21" r="1"/><circle cx="19" cy="21" r="1"/><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/>',
    ),
    chart => _svg(
      '<path d="M3 3v18h18"/><path d="m19 9-5 5-4-4-3 3"/>',
    ),
    book => _svg(
      '<path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20"/>',
    ),
    _ => _svg('<polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/>'),
  };
}
