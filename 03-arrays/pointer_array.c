/**
 * pointer_array.c
 * Hubungan antara pointer dan array
 */

#include <stdio.h>

int main() {
    int arr[5] = {10, 20, 30, 40, 50};
    int *p = arr;  // array = pointer ke elemen pertama
    
    printf("=== POINTER DAN ARRAY ===\n\n");
    
    printf("Cara 1: Akses dengan array biasa\n");
    for (int i = 0; i < 5; i++) {
        printf("arr[%d] = %d\n", i, arr[i]);
    }
    
    printf("\nCara 2: Akses dengan pointer notation\n");
    for (int i = 0; i < 5; i++) {
        printf("*(p + %d) = %d\n", i, *(p + i));
    }
    
    printf("\nCara 3: Akses pointer seperti array\n");
    for (int i = 0; i < 5; i++) {
        printf("p[%d] = %d\n", i, p[i]);
    }
    
    printf("\n=== ALAMAT MEMORI ELEMEN ARRAY ===\n\n");
    for (int i = 0; i < 5; i++) {
        printf("&arr[%d] = %p, nilai = %d\n", i, (void*)&arr[i], arr[i]);
    }
    
    printf("\n💡 Array adalah pointer terselubung!\n");

    return 0;
}
