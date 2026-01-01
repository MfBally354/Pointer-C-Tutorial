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
    printf("💡 Karena fungsi hanya menerima COPY dari a\n");

    return 0;
}
