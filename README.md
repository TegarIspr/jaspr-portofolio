# Portofolio Kanagara (Jaspr)

Website portofolio pribadi yang dibangun sepenuhnya dengan Dart menggunakan [Jaspr](https://jaspr.site), dirender statis sehingga bisa di-host gratis di GitHub Pages, Netlify, atau Vercel.

## Mengubah konten
Semua teks (nama, peran, tentang, skill, proyek, pengalaman, kontak) ada di `lib/data/profile.dart`. Tampilan ada di `web/styles.css`.

## Struktur
- `lib/main.server.dart` – dokumen HTML, meta, font
- `lib/app.dart` – susunan halaman
- `lib/sections/sections.dart` – Hero, About, Projects, Experience, Contact, Footer
- `lib/components/navbar.dart` – navbar + menu mobile (komponen `@client`)
- `lib/components/typing_text.dart` – efek mengetik di hero (komponen `@client`)
- `web/reveal.js` – animasi muncul saat menggulir

## Menjalankan
```bash
dart pub global activate jaspr_cli
dart pub get
jaspr serve        # mode pengembangan di http://localhost:8080
jaspr build        # hasil statis di build/jaspr
```
