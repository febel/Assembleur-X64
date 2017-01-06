bits 32
extern printf

section .data
	msg db 'Addition cumulée: %d',0xa, 0 
	addition_cumule dw 0

section .text
        ;On rend visible notre fonction additionne pour les fichiers externes
	global additionne 

;Fonction en convention cdecl
additionne:
	push ebp
	mov  ebp, esp
	push ecx

	mov ecx, [addition_cumule]
	add ecx, [ebp + 8]     ; On fait notre addition:  nb + addition_cumulée
	mov [addition_cumule], ecx    ; On met à jour addition_cumulée = addition_cumulée + nb
	push ecx
	push msg
	call printf     ; Équivalent de printf(msg, ecx). C'est un appel de type cdecl.
	add esp, 8

	pop ecx
	leave
	ret
