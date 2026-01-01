/**
 * string_pointer.c
 * String di C adalah array of char / pointer ke char
 */

#include <stdio.h>
#include <string.h>

int main() {
    char str1[] = "Linux";      // array
    char *str2 = "DevOps";      // pointer
    
    printf("=== STRING SEBAGAI POINTER ===\n\n");
    
    printf("String 1: %s\n", str1);
    printf("String 2: %s\n", str2);
    
    printf("\n=== AKSES KARAKTER ===\n\n");
    printf("str1[0] = %c\n", str1[0]);
    printf("str2[0] = %c\n", str2[0]);
    printf("*str2   = %c (sama dengan str2[0])\n", *str2);
    
    printf("\n=== ITERASI STRING ===\n\n");
    printf("Karakter di str2: ");
    for (int i = 0; str2[i] != '\0'; i++) {
        printf("%c ", str2[i]);
    }
    printf("\n");
    
    printf("\n=== POINTER ARITHMETIC ===\n\n");
    char *p = str2;
    while (*p != '\0') {
        printf("%c ", *p);
        p++;  // pindah ke karakter berikutnya
    }
    printf("\n");
    
    printf("\n💡 String di C diakhiri dengan '\\0' (null terminator)\n");

    return 0;
}
