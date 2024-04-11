        .text
        .global String_indexOf_1

String_indexOf_1:
    mov x3, x1                  // Store the character to search for in x3
    mov x1, x0                  // Move the address of the string to x1
    mov x2, 0                   // Initialize index counter to 0

search_loop:
    ldrb w4, [x1], #1           // Load the next byte of the string into w4 and increment x1
    cbz w4, not_found           // If end of string, character not found, jump to not_found

    cmp w4, w3                  // Compare the character with the character to search for
    beq found                   // If character found, jump to found

    add x2, x2, 1               // Increment index counter
    b search_loop               // Repeat loop

found:
    mov x0, x2                  // Store the index in x0
    ret                         // Return

not_found:
    mov x0, #-1                 // Character not found, set index to -1
    ret                         // Return
