# 🎯 Belajar Pointer di Bahasa C

Repository ini berisi kumpulan contoh kode sederhana untuk memahami konsep **pointer** dalam bahasa C.

## 📚 Daftar Isi

1. [Apa itu Pointer?](#apa-itu-pointer)
2. [Struktur Repository](#struktur-repository)
3. [Cara Compile dan Run](#cara-compile-dan-run)
4. [Contoh Program](#contoh-program)

## 🔑 Apa itu Pointer?

**Pointer** adalah variabel yang menyimpan **ALAMAT MEMORI**, bukan nilai langsung.

### 🧠 Analogi Sederhana

Bayangkan:
- `x = rumah`
- Nilai `10` = isi rumah
- Alamat rumah = lokasi (Jl. Merdeka No. 10)

📌 **Pointer itu alamat rumah, bukan isi rumah.**

### Perbedaan dengan Python/JavaScript

**Python/JavaScript:**
```python
x = 10  # langsung nilai
```

**C:**
```c
int x = 10;      // variabel dengan nilai
int *p = &x;     // pointer yang menyimpan alamat x
```

## 📁 Struktur Repository

```
pointer-c-tutorial/
├── README.md
├── 01-basic/
│   ├── pointer_dasar.c
│   └── alamat_memori.c
├── 02-functions/
│   ├── pass_by_value.c
│   ├── pass_by_pointer.c
│   └── swap_values.c
├── 03-arrays/
│   ├── pointer_array.c
│   └── string_pointer.c
├── 04-common-errors/
│   ├── null_pointer.c
│   └── dangling_pointer.c
└── Makefile
```

## 🛠️ Cara Compile dan Run

### Compile satu file:
```bash
gcc -o program nama_file.c
./program
```

### Compile semua (menggunakan Makefile):
```bash
make
```

### Clean compiled files:
```bash
make clean
```

## 📝 Contoh Program

### 1. Pointer Dasar
```c
int x = 10;
int *p = &x;

printf("Nilai x       : %d\n", x);    // 10
printf("Alamat x      : %p\n", &x);   // 0x7fff...
printf("Isi pointer p : %p\n", p);    // 0x7fff... (sama)
printf("Nilai lewat p : %d\n", *p);   // 10
```

**Penjelasan:**
- `&x` → ambil alamat memori x
- `int *p` → deklarasi pointer ke int
- `p = &x` → p menyimpan alamat x
- `*p` → ambil isi dari alamat (dereference)

### 2. Pointer & Function

**❌ Tanpa pointer (gagal mengubah nilai):**
```c
void ubah(int x) {
    x = 20;  // hanya mengubah copy
}
```

**✅ Dengan pointer (berhasil):**
```c
void ubah(int *x) {
    *x = 20;  // mengubah nilai asli
}
```

### 3. Pointer & Array

```c
int arr[3] = {1, 2, 3};
int *p = arr;

printf("%d\n", p[0]);     // 1
printf("%d\n", *(p + 1)); // 2
```

📌 **Array = pointer terselubung**

## 🧩 Ringkasan Operator

| Operator | Fungsi | Contoh |
|----------|--------|--------|
| `&` | Ambil alamat | `&x` |
| `*` | Ambil isi alamat (dereference) | `*p` |
| `*` | Deklarasi pointer | `int *p` |

## 💣 Kesalahan Umum (Segmentation Fault)

### ❌ Error: Pointer tidak diinisialisasi
```c
int *p;
*p = 10;  // CRASH! p belum menunjuk ke mana-mana
```

### ✅ Benar:
```c
int x;
int *p = &x;
*p = 10;  // OK
```

## 🎓 Kenapa DevOps Perlu Tahu Ini?

Pointer digunakan dalam:
- System calls Linux (`read()`, `write()`)
- Socket programming
- Memory management
- Buffer handling
- Config parsing

Contoh:
```c
ssize_t read(int fd, void *buf, size_t count);
//                    ^^^^^^^^
//                    pointer fleksibel
```

## 📖 Cara Belajar

1. Mulai dari `01-basic/`
2. Compile dan jalankan setiap program
3. Ubah kode dan lihat hasilnya
4. Lanjut ke folder berikutnya

## 🤝 Kontribusi

Silakan buat pull request jika ingin menambahkan contoh! Terima Kasih!

## 📄 Lisensi

MIT License

---

**Happy Coding! 🚀**
