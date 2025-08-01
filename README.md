# 📺 Xibo 1.6 - Legacy Docker Container Setup

Project ini adalah konfigurasi Docker untuk menjalankan **Xibo CMS versi 1.6.4** secara cepat dan efisien. Cocok buat testing, demo, atau keperluan internal yang butuh versi lawas Xibo.
dimana di versi 1.6 ini masih suport free android client, karena setelah versi ini,, xibo player for android sudah berbayar

---

## 🚀 Langkah Instalasi

### 1. Clone repository
```bash
git clone https://github.com/blackant08/xibo-legacy.git
cd xibo-legacy
```

### 2. Build Docker container
```bash
docker compose build --no-cache
```

### 3. Jalankan container
```bash
docker compose up -d
```

---

## ✅ Cek Status Container
```bash
docker ps
```

Pastikan service `xibo` dan `xibo-db` sudah **Up**.

---

## 🌐 Akses Xibo CMS

Buka browser dan akses:
```
http://localhost:8082
```

> Kalau di server atau VPS, ganti `localhost` dengan IP server.

---

## 🔥 Penting! Buka Port Firewall

Pastikan port `8082` diizinkan oleh firewall:

### Di Ubuntu (UFW):
```bash
sudo ufw allow 8082/tcp
```

### Di CentOS/RedHat (firewalld):
```bash
sudo firewall-cmd --permanent --add-port=8082/tcp
sudo firewall-cmd --reload
```

---

## ⚙️ Default Konfigurasi Database

| Key              | Value                  |
|------------------|------------------------|
| DB Name          | `xibo`                 |
| DB User          | `xibouser`             |
| DB Password      | `P@ssw0rd123`          |
| DB Host          | `xibo-db`              |
| Library Location | '/var/www/xibo-library |

---

## 📂 Struktur Folder

```
.
├── docker-compose.yml
├── Dockerfile
└── (Xibo files auto-download saat build)
```

---

## 📣 Catatan

- Ini versi **legacy**, jadi tidak cocok untuk deployment production jangka panjang.
- Pakai PHP 5.6 dan MySQL 5.5 (sesuai kebutuhan Xibo 1.6).
- Source Xibo diambil otomatis dari [launchpad.net](https://launchpad.net/xibo).

---

## 💬 Kontak

Maintainer: [@blackant08](https://github.com/blackant08)  
Silakan open issue kalau ada masalah atau pertanyaan.
