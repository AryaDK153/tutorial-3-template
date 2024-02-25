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

Aturan:
- Ketika di platform dan tidak berlari (dashing), pemain bisa bergerak lebih pelan ke arah kanan/kiri ketika menekan tombol bawah
> Dengan menggunakan dash flag dan is_on_floor, kita dapat mendeteksi kondisi pemain dan mengurangi kecepatan geraknya ketika menekan tombol bawah
### Sliding

Aturan:
- Ketika dashing di platform, pemain bisa menekan tombol bawah dan melakukan sliding
> Dengan menggunakan dash flag dan is_on_floor, kita dapat mendeteksi kondisi pemain dan mengurangi kecepatan geraknya ketika menekan tombol bawah
- Sliding memiliki batasan, dimana gerakan pemain akan semakin lambat hingga berhenti
> Kecepatan gerak berkurang secara perlahan, digunakan variable dynamic speed yang dapat kita ubah kapanpun agar tidak langsung mengubah speed tiap frame

> Kita tambahkan juga variable friction (gesekan) untuk menentukan seberapa cepat kita ingin pemain melambat, tiap frame, dynamic speed akan berkurang hingga pemain melepas tombol bawah, setelah itu kembalikan dynamic speed ke semula (=speed)
### Plunging

Aturan:
- Tidak dapat dibatalkan
> Gunakan Input.is_action_just_pressed()
- Hanya saat di udara
> Tambahkan kondisi "not is_on_floor"
## Extra
### Respawn

Agar tidak perlu reload game tiap jatuh dari platform dan objek pemain hilang
Aturan:
- Ketika pemain jatuh di luar area main, pindahkan objek pemain kembali ke titik hidup (spawnpoint)
> ubah posisi objek ke spawnpoint ketika melewati batas bawah area main (gunakan OS.get_window_size().y)
- Spawnpoint sesuai titik hidup awal load game
> pada _ready(), simpan titik posisi pemain dalam variable spawnpoint
