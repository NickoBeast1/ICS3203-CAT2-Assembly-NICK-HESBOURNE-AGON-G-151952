section .data
    prompt db "Enter a number: ", 0                ; Message to prompt user input
    positive_msg db "The number is POSITIVE.", 0   ; Message for positive numbers
    negative_msg db "The number is NEGATIVE.", 0   ; Message for negative numbers
    zero_msg db "The number is ZERO.", 0           ; Message for zero

section .bss
    number resb 10                                 ; Buffer to store user input

section .text
    global _start

_start:
    ; Prompt the user for input
    mov rax, 1                                     ; System call: write
    mov rdi, 1                                     ; File descriptor: stdout
    mov rsi, prompt                                ; Address of the prompt
    mov rdx, 17                                    ; Length of the prompt
    syscall                                        ; Trigger the system call

    ; Read user input
    mov rax, 0                                     ; System call: read
    mov rdi, 0                                     ; File descriptor: stdin
    mov rsi, number                                ; Address of the input buffer
    mov rdx, 10                                    ; Max number of bytes to read
    syscall                                        ; Trigger the system call

    ; Convert string to integer
    mov rsi, number                                ; Address of input buffer
    call str_to_int                                ; Convert string to integer
    mov ebx, eax                                   ; Store converted number in ebx

    ; Compare the number with zero
    cmp ebx, 0                                     ; Compare the number in ebx with 0
    jg positive                                    ; If ebx > 0, jump to 'positive' label
    jl negative                                    ; If ebx < 0, jump to 'negative' label
    jmp zero                                       ; Otherwise, jump to 'zero' label

positive:
    ; Output positive message
    mov rax, 1                                     ; System call: write
    mov rdi, 1                                     ; File descriptor: stdout
    mov rsi, positive_msg                          ; Address of the positive message
    mov rdx, 23                                    ; Length of the message
    syscall                                        ; Trigger the system call
    jmp end                                        ; Jump unconditionally to 'end'

negative:
    ; Output negative message
    mov rax, 1                                     ; System call: write
    mov rdi, 1                                     ; File descriptor: stdout
    mov rsi, negative_msg                          ; Address of the negative message
    mov rdx, 23                                    ; Length of the message
    syscall                                        ; Trigger the system call
    jmp end                                        ; Jump unconditionally to 'end'

zero:
    ; Output zero message
    mov rax, 1                                     ; System call: write
    mov rdi, 1                                     ; File descriptor: stdout
    mov rsi, zero_msg                              ; Address of the zero message
    mov rdx, 18                                    ; Length of the message
    syscall                                        ; Trigger the system call

end:
    ; Exit program
    mov rax, 60                                    ; System call: exit
    xor rdi, rdi                                   ; Exit code: 0
    syscall                                        ; Trigger the system call

; Helper function: Convert string to integer
; Assumes input is a valid numeric string
str_to_int:
    xor eax, eax                                   ; Clear eax (result)
    xor ebx, ebx                                   ; Clear ebx (sign)
    mov bl, 0                                      ; Assume positive (sign = 0)

    mov cl, byte [rsi]                             ; Load the first character
    cmp cl, '-'                                    ; Check if the number is negative
    jne .process_digits                            ; If not '-', jump to process digits
    mov bl, 1                                      ; Set sign = 1 for negative numbers
    inc rsi                                        ; Move to the next character

.process_digits:
    xor ecx, ecx                                   ; Clear ecx (current digit)

.next_digit:
    mov cl, byte [rsi]                             ; Load the current character
    cmp cl, 10                                     ; Check for newline
    je .done                                       ; If newline, exit loop
    sub cl, '0'                                    ; Convert ASCII to number
    imul eax, eax, 10                              ; Multiply result by 10
    add eax, ecx                                   ; Add current digit to result
    inc rsi                                        ; Move to the next character
    jmp .next_digit                                ; Repeat for next digit

.done:
    cmp bl, 1                                      ; Check if the sign is negative
    jne .return                                    ; If not negative, return
    neg eax                                        ; Negate the result for negative numbers

.return:
    ret                                            ; Return result in eax
