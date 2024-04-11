        .text
        .global String_indexOf_2

String_indexOf_2:
        // Argument 1: Address of the string (string1) in x1
        // Argument 2: Character to search for (ch) in x2
        // Argument 3: Starting index (fromIndex) in x3

        // Ensure fromIndex is not negative
        cmp x3, 0
        blt not_found               // If fromIndex is negative, character not found, jump to not_found

        // Increment the address of the string to fromIndex
        add x1, x1, x3

search_loop:
        ldrb    w4, [x1], #1           // Load the next byte of the string into w4 and increment x1
        cbz     w4, not_found           // If end of string, character not found, jump to not_found

        cmp     w4, w2                  // Compare the character with the current byte of the string
        beq     found                   // If character found, jump to found

        add     x0, x0, 1               // Increment index counter
        b       search_loop               // Repeat loop

found:
        ret                          // Return with index in x0

not_found:
        mov     x0, #-1                 // Character not found, set index to -1
        ret                          // Return -1
