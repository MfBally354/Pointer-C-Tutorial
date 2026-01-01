#!/bin/bash

# Script untuk setup repository pointer-c-tutorial
# Jalankan di server Linux kamu

set -e  # Exit jika ada error

REPO_NAME="pointer-c-tutorial"

echo "🚀 Setup Repository: $REPO_NAME"
echo "================================"

# 1. Buat direktori utama
echo "📁 Membuat struktur direktori..."
mkdir -p $REPO_NAME
cd $REPO_NAME

mkdir -p 01-basic
mkdir -p 02-functions
mkdir -p 03-arrays
mkdir -p 04-common-errors

# 2. Buat README.md
echo "📝 Membuat README.md..."
cat > README.md << 'EOF'
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

Silakan buat pull request jika ingin menambahkan contoh!

## 📄 Lisensi

MIT License

---

**Happy Coding! 🚀**
EOF

# 3. Buat file .c
echo "💻 Membuat file-file C..."

# 01-basic/pointer_dasar.c
cat > 01-basic/pointer_dasar.c << 'EOF'
/**
 * pointer_dasar.c
 * Contoh paling dasar penggunaan pointer
 */

#include <stdio.h>

int main() {
    int x = 10;
    int *p = &x;

    printf("=== POINTER DASAR ===\n\n");
    
    printf("Nilai x       : %d\n", x);
    printf("Alamat x      : %p\n", (void*)&x);
    printf("Isi pointer p : %p\n", (void*)p);
    printf("Nilai lewat p : %d\n", *p);
    
    printf("\n=== MENGUBAH NILAI LEWAT POINTER ===\n\n");
    
    *p = 20;
    printf("Setelah *p = 20\n");
    printf("Nilai x       : %d\n", x);
    printf("Nilai lewat p : %d\n", *p);

    return 0;
}
EOF

# 01-basic/alamat_memori.c
cat > 01-basic/alamat_memori.c << 'EOF'
/**
 * alamat_memori.c
 * Memahami alamat memori dan ukuran tipe data
 */

#include <stdio.h>

int main() {
    int a = 100;
    int b = 200;
    int c = 300;
    
    printf("=== ALAMAT MEMORI ===\n\n");
    
    printf("Variabel a = %d, alamat: %p\n", a, (void*)&a);
    printf("Variabel b = %d, alamat: %p\n", b, (void*)&b);
    printf("Variabel c = %d, alamat: %p\n", c, (void*)&c);
    
    printf("\n=== UKURAN TIPE DATA ===\n\n");
    
    printf("Ukuran int     : %lu bytes\n", sizeof(int));
    printf("Ukuran int*    : %lu bytes\n", sizeof(int*));
    printf("Ukuran char    : %lu bytes\n", sizeof(char));
    printf("Ukuran char*   : %lu bytes\n", sizeof(char*));
    printf("Ukuran double  : %lu bytes\n", sizeof(double));
    printf("Ukuran double* : %lu bytes\n", sizeof(double*));
    
    printf("\n💡 Catatan: Ukuran pointer selalu sama!\n");

    return 0;
}
EOF

# 02-functions/pass_by_value.c
cat > 02-functions/pass_by_value.c << 'EOF'
/**
 * pass_by_value.c
 * Contoh pass by value (GAGAL mengubah nilai asli)
 */

#include <stdio.h>

void ubah_nilai(int x) {
    printf("Dalam fungsi SEBELUM: x = %d\n", x);
    x = 20;
    printf("Dalam fungsi SESUDAH: x = %d\n", x);
}

int main() {
    int a = 10;
    
    printf("=== PASS BY VALUE ===\n\n");
    printf("Sebelum panggil fungsi: a = %d\n\n", a);
    
    ubah_nilai(a);
    
    printf("\nSetelah panggil fungsi: a = %d\n", a);
    printf("\n❌ Nilai a TIDAK berubah!\n");

    return 0;
}
EOF

# 02-functions/pass_by_pointer.c
cat > 02-functions/pass_by_pointer.c << 'EOF'
/**
 * pass_by_pointer.c
 * Contoh pass by pointer (BERHASIL mengubah nilai asli)
 */

#include <stdio.h>

void ubah_nilai(int *x) {
    printf("Dalam fungsi SEBELUM: *x = %d\n", *x);
    *x = 20;
    printf("Dalam fungsi SESUDAH: *x = %d\n", *x);
}

int main() {
    int a = 10;
    
    printf("=== PASS BY POINTER ===\n\n");
    printf("Sebelum panggil fungsi: a = %d\n\n", a);
    
    ubah_nilai(&a);
    
    printf("\nSetelah panggil fungsi: a = %d\n", a);
    printf("\n✅ Nilai a BERUBAH!\n");

    return 0;
}
EOF

# 02-functions/swap_values.c
cat > 02-functions/swap_values.c << 'EOF'
/**
 * swap_values.c
 * Menukar nilai dua variabel menggunakan pointer
 */

#include <stdio.h>

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main() {
    int x = 5;
    int y = 10;
    
    printf("=== SWAP MENGGUNAKAN POINTER ===\n\n");
    printf("Sebelum swap:\n");
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    
    swap(&x, &y);
    
    printf("\nSetelah swap:\n");
    printf("x = %d\n", x);
    printf("y = %d\n", y);

    return 0;
}
EOF

# 03-arrays/pointer_array.c
cat > 03-arrays/pointer_array.c << 'EOF'
/**
 * pointer_array.c
 * Hubungan antara pointer dan array
 */

#include <stdio.h>

int main() {
    int arr[5] = {10, 20, 30, 40, 50};
    int *p = arr;
    
    printf("=== POINTER DAN ARRAY ===\n\n");
    
    printf("Cara 1: Akses dengan array biasa\n");
    for (int i = 0; i < 5; i++) {
        printf("arr[%d] = %d\n", i, arr[i]);
    }
    
    printf("\nCara 2: Akses dengan pointer\n");
    for (int i = 0; i < 5; i++) {
        printf("*(p + %d) = %d\n", i, *(p + i));
    }
    
    printf("\n💡 Array = pointer terselubung!\n");

    return 0;
}
EOF

# 03-arrays/string_pointer.c
cat > 03-arrays/string_pointer.c << 'EOF'
/**
 * string_pointer.c
 * String di C adalah pointer ke char
 */

#include <stdio.h>

int main() {
    char str1[] = "Linux";
    char *str2 = "DevOps";
    
    printf("=== STRING SEBAGAI POINTER ===\n\n");
    
    printf("String 1: %s\n", str1);
    printf("String 2: %s\n", str2);
    
    printf("\nAkses karakter:\n");
    printf("str2[0] = %c\n", str2[0]);
    printf("*str2   = %c\n", *str2);
    
    printf("\nIterasi string:\n");
    char *p = str2;
    while (*p != '\0') {
        printf("%c ", *p);
        p++;
    }
    printf("\n");

    return 0;
}
EOF

# 04-common-errors/null_pointer.c
cat > 04-common-errors/null_pointer.c << 'EOF'
/**
 * null_pointer.c
 * Contoh kesalahan NULL pointer
 */

#include <stdio.h>
#include <stdlib.h>

void contoh_error() {
    int *p;
    // *p = 10;  // ❌ CRASH!
    printf("❌ Pointer tidak diinisialisasi!\n");
}

void contoh_benar() {
    int x = 5;
    int *p = &x;
    *p = 10;
    printf("✅ Nilai x: %d\n", x);
}

void contoh_malloc() {
    int *p = (int*)malloc(sizeof(int));
    
    if (p == NULL) {
        printf("❌ Malloc gagal!\n");
        return;
    }
    
    *p = 42;
    printf("✅ Nilai dari malloc: %d\n", *p);
    free(p);
}

int main() {
    printf("=== NULL POINTER ===\n\n");
    contoh_error();
    contoh_benar();
    contoh_malloc();

    return 0;
}
EOF

# 04-common-errors/dangling_pointer.c
cat > 04-common-errors/dangling_pointer.c << 'EOF'
/**
 * dangling_pointer.c
 * Contoh dangling pointer
 */

#include <stdio.h>
#include <stdlib.h>

int* fungsi_aman() {
    int *p = (int*)malloc(sizeof(int));
    *p = 10;
    return p;
}

int main() {
    printf("=== DANGLING POINTER ===\n\n");
    
    int *ptr = fungsi_aman();
    printf("✅ Nilai dari malloc: %d\n", *ptr);
    
    free(ptr);
    ptr = NULL;  // Set ke NULL setelah free
    
    printf("✅ Pointer sudah aman\n");

    return 0;
}
EOF

# 4. Buat Makefile
echo "🔧 Membuat Makefile..."
cat > Makefile << 'EOF'
CC = gcc
CFLAGS = -Wall -Wextra -std=c11

DIR_BASIC = 01-basic
DIR_FUNC = 02-functions
DIR_ARRAY = 03-arrays
DIR_ERROR = 04-common-errors

BASIC_TARGETS = $(DIR_BASIC)/pointer_dasar $(DIR_BASIC)/alamat_memori
FUNC_TARGETS = $(DIR_FUNC)/pass_by_value $(DIR_FUNC)/pass_by_pointer $(DIR_FUNC)/swap_values
ARRAY_TARGETS = $(DIR_ARRAY)/pointer_array $(DIR_ARRAY)/string_pointer
ERROR_TARGETS = $(DIR_ERROR)/null_pointer $(DIR_ERROR)/dangling_pointer

ALL_TARGETS = $(BASIC_TARGETS) $(FUNC_TARGETS) $(ARRAY_TARGETS) $(ERROR_TARGETS)

.PHONY: all clean

all: $(ALL_TARGETS)
	@echo "✅ Semua program berhasil dikompilasi!"

%: %.c
	@echo "🔨 Compiling $<..."
	@$(CC) $(CFLAGS) $< -o $@

clean:
	@rm -f $(ALL_TARGETS)
	@echo "✅ Clean complete!"
EOF

# 5. Buat .gitignore
echo "📄 Membuat .gitignore..."
cat > .gitignore << 'EOF'
# Compiled files
01-basic/pointer_dasar
01-basic/alamat_memori
02-functions/pass_by_value
02-functions/pass_by_pointer
02-functions/swap_values
03-arrays/pointer_array
03-arrays/string_pointer
04-common-errors/null_pointer
04-common-errors/dangling_pointer

# Object files
*.o
*.obj

# Editor files
*.swp
*~
.vscode/
.idea/

# System files
.DS_Store
EOF

# 6. Initialize git
echo "🎯 Initialize Git Repository..."
git init
git add .
git commit -m "Initial commit: Pointer C tutorial repository"

# 7. Instruksi selanjutnya
echo ""
echo "✅ Repository berhasil dibuat!"
echo ""
echo "📋 Langkah selanjutnya:"
echo "1. Buat repository di GitHub"
echo "2. Jalankan command berikut:"
echo ""
echo "   git remote add origin git@github.com:USERNAME/$REPO_NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "🔨 Untuk compile semua program:"
echo "   cd $REPO_NAME"
echo "   make"
echo ""
echo "🧪 Untuk test salah satu program:"
echo "   ./01-basic/pointer_dasar"
echo ""
