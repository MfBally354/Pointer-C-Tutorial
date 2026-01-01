/**
 * null_pointer.c
 * Contoh kesalahan NULL pointer dan cara menghindarinya
 */

#include <stdio.h>
#include <stdlib.h>

void contoh_error() {
    int *p;  // pointer tidak diinisialisasi
    // *p = 10;  // ❌ BAHAYA! Segmentation Fault
    printf("❌ Baris di atas (yang dikomentari) akan crash!\n");
}

void contoh_benar() {
    int x = 5;
    int *p = &x;  // pointer menunjuk ke variabel valid
    *p = 10;       // ✅ AMAN
    printf("✅ Nilai x setelah diubah lewat pointer: %d\n", x);
}

void contoh_null_check() {
    int *p = NULL;  // inisialisasi dengan NULL
    
    // Selalu cek pointer sebelum digunakan!
    if (p != NULL) {
        *p = 10;
    } else {
        printf("⚠️  Pointer adalah NULL, tidak bisa dereference!\n");
    }
}

void contoh_malloc() {
    int *p = (int*)malloc(sizeof(int));
    
    if (p == NULL) {
        printf("❌ Malloc gagal!\n");
        return;
    }
    
    *p = 42;
    printf("✅ Nilai dari malloc: %d\n", *p);
    
    free(p);  // jangan lupa free!
    p = NULL; // set ke NULL setelah free
}

int main() {
    printf("=== NULL POINTER ERRORS ===\n\n");
    
    printf("1. Pointer tidak diinisialisasi:\n");
    contoh_error();
    
    printf("\n2. Cara yang benar:\n");
    contoh_benar();
    
    printf("\n3. NULL check:\n");
    contoh_null_check();
    
    printf("\n4. Menggunakan malloc:\n");
    contoh_malloc();
    
    printf("\n💡 Tips:\n");
    printf("   - Selalu inisialisasi pointer\n");
    printf("   - Cek NULL sebelum dereference\n");
    printf("   - Set NULL setelah free()\n");

    return 0;
}
