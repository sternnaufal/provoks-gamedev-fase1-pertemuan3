# PROVOKS Game Dev — Fase 1, Checkpoint Pertemuan 3

Project Godot 4 contoh untuk **Pertemuan 3: Gameplay Mechanics — Spawning & Collisions**.
Isi: karakter bisa jalan kiri-kanan, buah muncul otomatis dari atas, jatuh, lalu hilang saat ditangkap atau lewat bawah layar.

Belum ada skor, nyawa, atau game over — itu materi Pertemuan 4.

## Jalankan

1. Buka **Godot 4** (dites di 4.7.2, seharusnya jalan di 4.4+).
2. **Import** → pilih `project.godot` di folder ini.
3. Tekan **F5**.

Kontrol: **A / D** atau **← / →** untuk gerak.

## Struktur

```
project.godot          800x600, stretch canvas_items, texture filter Nearest
Assets/
  player.png
  fruit.png
Scenes/
  main.tscn            Main → Player + Spawner (Timer)
  Player.tscn          Area2D, layer 1
  Fruit.tscn           Area2D, layer 0, mask 1
Scripts/
  player.gd            gerak horizontal + clamp
  spawner.gd           Timer → instantiate buah
  fruit.gd             jatuh + queue_free
```

## Checklist checkpoint (akhir Pertemuan 3)

Semua poin ini harus benar supaya buah muncul dan bisa ditangkap:

- [ ] `Player` = **Area2D**, `collision_layer = 1`
- [ ] `Fruit` = **Area2D**, `collision_layer = 0`, `collision_mask = 1`
- [ ] `Fruit` punya **Sprite2D** (ada texture) dan **CollisionShape2D** (CircleShape2D radius 12)
- [ ] `Spawner` = **Timer** dengan `wait_time = 2.0`, `autostart = ON`, `one_shot = OFF`
- [ ] `spawner.gd` nempel di node **Spawner**, slot `fruit_scene` = `Fruit.tscn`
- [ ] `fruit.gd` nempel di root **Fruit**
- [ ] Tekan **F5** → buah muncul tiap ±2 detik di X acak
- [ ] Buah jatuh ke bawah, hilang saat disentuh player, hilang sendiri setelah lewat layar

## Kalau ada masalah

| Gejala | Penyebab paling sering |
|---|---|
| Buah tidak muncul | slot `fruit_scene` kosong, `autostart` OFF, script tidak nempel |
| Buah muncul tapi diam | `_process` tidak ada / `fall_speed = 0` |
| Tidak hilang saat disentuh | CollisionShape kosong, `collision_mask` salah, signal belum di-connect |
| Error `instantiate on null` | slot `fruit_scene` belum diisi |
| Game makin berat | `queue_free()` tidak dipanggil, node menumpuk |

## Bonus

- Ubah `wait_time` jadi `0.5` → lebih ramai.
- Ubah `fall_speed` jadi `350` → lebih sulit.
- Tambah variasi gambar buah dari spritesheet `Fruit+.png` + `region_rect` acak (lihat versi GameJadi di repo kurikulum).
