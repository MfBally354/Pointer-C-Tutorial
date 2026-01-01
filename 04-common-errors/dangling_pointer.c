/**
 * dangling_pointer.c
 * Contoh dangling pointer (pointer menunjuk ke memori yang sudah tidak valid)
 */

#include <stdio.h>
#include <stdlib.h>

int* fungsi_bahaya() {
    int x = 10;  // variabel lokal
    return &x;   // ❌ BAHAYA! x akan hilang setelah fungsi selesai
}

int* fungsi_aman() {
    int *p = (int*)malloc(sizeof(int));
    *p = 10;
    return p;    // ✅ AMAN, memori di heap tetap ada
}

int main() {
    printf("=== DANGLING POINTER ===\n\n");
    
    printf("1. Contoh BAHAYA - Return pointer ke variabel lokal:\n");
    int *ptr1 = fungsi_bahaya();
    printf("⚠️  ptr1 menunjuk ke memori yang tidak valid!\n");
    // printf("Nilai: %d\n", *ptr1);  // Berbahaya!
    
    printf("\n2. Contoh AMAN - Return pointer dari malloc:\n");
    int *ptr2 = fungsi_aman();
    printf("✅ Nilai dari malloc: %d\n", *ptr2);
    free(ptr2);
    ptr2 = NULL;
    
    printf("\n3. Contoh dangling setelah free:\n");
    int *ptr3 = (int*)malloc(sizeof(int));
    *ptr3 = 42;
    printf("Sebelum free: %d\n", *ptr3);
    
    free(ptr3);
    // ptr3 sekarang dangling!
    // printf("Setelah free: %d\n", *ptr3);  // ❌ Berbahaya!
    
    ptr3 = NULL;  // ✅ Set ke NULL
    printf("✅ Pointer sudah di-set ke NULL\n");
    
    printf("\n💡 Tips menghindari dangling pointer:\n");
    printf("   - Jangan return pointer ke variabel lokal\n");
    printf("   - Set pointer ke NULL setelah free()\n");
    printf("   - Gunakan malloc untuk data yang perlu bertahan\n");

    return 0;
}
