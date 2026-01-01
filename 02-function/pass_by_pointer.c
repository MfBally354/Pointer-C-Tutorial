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
    
    ubah_nilai(&a);  // kirim ALAMAT a
    
    printf("\nSetelah panggil fungsi: a = %d\n", a);
    printf("\n✅ Nilai a BERUBAH!\n");
    printf("💡 Karena fungsi menerima ALAMAT dari a\n");

    return 0;
}
