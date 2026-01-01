/**
 * pointer_dasar.c
 * Contoh paling dasar penggunaan pointer
 */

#include <stdio.h>

int main() {
    int x = 10;
    int *p = &x;  // p menyimpan alamat x

    printf("=== POINTER DASAR ===\n\n");
    
    printf("Nilai x       : %d\n", x);
    printf("Alamat x      : %p\n", (void*)&x);
    printf("Isi pointer p : %p\n", (void*)p);
    printf("Nilai lewat p : %d\n", *p);
    
    printf("\n=== MENGUBAH NILAI LEWAT POINTER ===\n\n");
    
    *p = 20;  // ubah nilai x lewat pointer
    printf("Setelah *p = 20\n");
    printf("Nilai x       : %d\n", x);
    printf("Nilai lewat p : %d\n", *p);

    return 0;
}
