# Fungsi Tambahan
Menambahkan fungsi-fungsi berikut ke dalam objek player bisa terbilang cukup sederhana, selama kita mengikuti aturan-aturan yang diinginkan
## Movement Set
### Double Jump

Aturan:
- Double jump sebagai cara lain menyebut lompatan udara
> Menambahkan pembacaan Input berbeda dengan lompatan biasa
- Lompatan kedua hanya terjadi ketika sedang di udara. Ini asal usul "double jump", satu lompatan biasa dan satu lompatan udara
> Menambahkan kondisi agar pemain dapat melompat ketika menekan tombol atas ketika "not is_on_floor()"
- Batas pemakaian lompatan udara adalah satu kali setelah beranjak dari platform dengan cara apapun
> Menghitung lompatan yang dilakukan di udara, buat maksimal satu kali
- Lompatan udara lebih lemah dari lompatan biasa, idenya karena tidak ada pijakan saat di udara
> Disesuaikan dengan kekuatan gravitasi, kali ini lompatan udara dibuat 4/5 (empat per lima) dari kekuatan lompat biasa
### Dashing

Aturan:
- Ketika melakukan dash, pemain bergerak lebih cepat dari kecepatan gerak kanan/kiri biasa
> Menambahkan flag sebagai pertanda untuk membuat player bergerak lebih cepat, kali ini dibuat dua kali lebih cepat
- Dash terjadi ketika pemain menekan tombol kanan/kiri dua kali dalam waktu singkat
> Memanfaatkan delta sebagai timer, serta mengatur click count dan flag sebagai tanda gagal atau berhasil melakukan dash
### Crouching
### Sliding
### Plunging
## Extra
### Respawn
