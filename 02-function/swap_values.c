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
    
    printf("\n✅ Nilai berhasil ditukar!\n");

    return 0;
}
