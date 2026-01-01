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
    
    printf("\n💡 Catatan: Ukuran pointer selalu sama, tidak peduli tipe data!\n");

    return 0;
}
