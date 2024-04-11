        .text
        .global String_lastIndexOf_1

String_lastIndexOf_1:
    // Argument 1: Address of the string (string1) in x1
    // Argument 2: Character to search for (ch) in w2

    mov x0, #0                 // Initialize index counter to -1

search_loop:
    ldrb w3, [x1], #1           // Load byte from address in x1, increment x1 by 1
    cbz w3, not_found          // If end of string, character not found, jump to not_found

    cmp w3, w2                  // Compare the byte with the specified character
    bne search_continue         // If bytes are not equal, continue searching

    mov x0, x1                  // Update index counter with the current address

search_continue:
    b search_loop               // Continue searching

not_found:
    sub x0, x1, x0             // Calculate the index of the last occurrence of the character
    sub x0, x0, #3             // Adjust the index to be zero-based
    ret                         // Return the index (stored in x0)
