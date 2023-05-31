global ft_strdup

extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
	push 	rsi					; Push rsi for not causing bug in parent caller
	push	rdi					; save str for later
	call	ft_strlen			; get length of str
	inc		rax					; len + 1 for end \0
	mov		rdi, rax			; rdi = str length
	call	malloc wrt ..plt	; malloc(rdi)
	cmp		rax, 0				; if malloc return == NULL
	je		failure				;  > return NULL
	mov		rdi, rax			; rdi = new_str
	pop		rsi					; rsi = str
	call	ft_strcpy			; ft_strcpy(rdi, rsi)
	pop		rsi
	ret

failure:
	pop		rsi					; clean
	pop		rdi					; clean
	mov		rax, 0				; retrn 0
	ret