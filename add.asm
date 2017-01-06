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
;programme en C pour utiliser l'addition ci dessus, a ecrire dans un fichier séparé et a compiler avec GCC et le programme assembleur dans le meme repertoire
;void additionne(int nb);
;
;int main()
;{
;	int i;
;	for(i=0; i<10; i++)
;	{
;		additionne(i);
;	}
;	return 0;
;}
