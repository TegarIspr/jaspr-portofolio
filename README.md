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
- `lib/components/project_gallery.dart` – filter proyek + jendela detail (komponen `@client`)
- `lib/components/contact_form.dart` – form kontak dengan validasi + salin email (komponen `@client`)
- `web/reveal.js` – animasi muncul, penghitung angka, progress gulir, menu aktif, efek kartu

## Menjalankan
```bash
dart pub global activate jaspr_cli
dart pub get
jaspr serve        # mode pengembangan di http://localhost:8080
jaspr build        # hasil statis di build/jaspr
```

## Deploy
Setiap push ke `main` otomatis di-build dan di-deploy ke GitHub Pages lewat `.github/workflows/deploy.yml`
(aktifkan sekali di Settings → Pages → Source: **GitHub Actions**). Situs tayang di https://tegarispr.github.io/jaspr-portofolio/.
