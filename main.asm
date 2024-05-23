includelib <kernel32.lib>
includelib <ucrt.lib>
includelib <legacy_stdio_definitions.lib>
includelib <legacy_stdio_wide_specifiers.lib>
includelib <msvcrt.lib>
includelib <vcruntime.lib>

EXTERN printf: PROC
EXTERN scanf: PROC
EXTERN ExitProcess: PROC
EXTERN _CRT_INIT: PROC
EXTERN cosf: PROC

.data
num_format BYTE "%d",10,0

.code

main PROC ; function main

push    rbp
mov     rbp, rsp
sub     rsp, 32
call    _CRT_INIT ; init crt

; main code

mov rax, 1

sub rsp, 8 ; reserve space for i
push rax ; int i = 1

loop0001_lb:

mov rbp, rsp
sub rsp, 32

lea rcx, num_format
mov rdx, [rbp]
add rdx, rdx
mov [rbp], rdx

call printf


mov rsp, rbp


mov rbp, rsp
sub rsp, 32

mov rdx, [rbp]
cmp rdx, 0

mov rsp, rbp

jne loop0001_lb


push 0
call quit



main ENDP


getexit PROC ; function getexit



getexit ENDP

quit PROC ; function quit (value: exit)
    mov rcx, [rsp+8]
    call ExitProcess ; End the process.
quit ENDP

END
