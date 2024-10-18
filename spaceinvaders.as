;------------------------------------------------------------------------------
; ZONA I: Definicao de constantes
;         Pseudo-instrucao : EQU
;------------------------------------------------------------------------------
CR              EQU     0Ah
FIM_TEXTO       EQU     '@'
IO_READ         EQU     FFFFh
IO_WRITE        EQU     FFFEh
IO_STATUS       EQU     FFFDh
INITIAL_SP      EQU     FDFFh
CURSOR		    EQU     FFFCh
CURSOR_INIT		EQU		FFFFh

TIMER_UNITS     EQU 	FFF6h
ACTIVATE_TIMER  EQU  	FFF7h

ROW_POSITION	EQU		0d
COL_POSITION	EQU		0d
ROW_SHIFT		EQU		8d
COLUMN_SHIFT	EQU		8d

ON 				EQU     1d 
OFF 			EQU     0d

ENEMY_RIGHT_DIRECTION EQU 0d 
ENEMY_LEFT_DIRECTION EQU 1d 

;------------------------------------------------------------------------------
; ZONA II: definicao de variaveis
;          Pseudo-instrucoes : WORD - palavra (16 bits)
;                              STR  - sequencia de caracteres (cada ocupa 1 palavra: 16 bits).
;          Cada caracter ocupa 1 palavra
;------------------------------------------------------------------------------

                ORIG    8000h

LINE0			STR     '################################################################################', FIM_TEXTO
LINE1			STR     '# SCORE: 0000                                                                  #', FIM_TEXTO
LINE2			STR     '#                                                                              #', FIM_TEXTO
LINE3			STR     '#                                                                              #', FIM_TEXTO
LINE4			STR     '#                       M  M  M  M  M  M  M  M  M  M  M                        #', FIM_TEXTO
LINE5			STR     '#                       M  M  M  M  M  M  M  M  M  M  M                        #', FIM_TEXTO
LINE6			STR     '#                       M  M  M  M  M  M  M  M  M  M  M                        #', FIM_TEXTO
LINE7			STR     '#                       M  M  M  M  M  M  M  M  M  M  M                        #', FIM_TEXTO
LINE8			STR     '#                       M  M  M  M  M  M  M  M  M  M  M                        #', FIM_TEXTO
LINE9			STR     '#                                                                              #', FIM_TEXTO
LINE10			STR     '#                                                                              #', FIM_TEXTO
LINE11			STR     '#                                                                              #', FIM_TEXTO
LINE12			STR     '#                                                                              #', FIM_TEXTO
LINE13			STR     '#                                                                              #', FIM_TEXTO
LINE14			STR     '#                                                                              #', FIM_TEXTO
LINE15			STR     '#                                                                              #', FIM_TEXTO
LINE16			STR     '#                                                                              #', FIM_TEXTO
LINE17			STR     '#                                                                              #', FIM_TEXTO
LINE18			STR     '#                                                                              #', FIM_TEXTO
LINE19			STR     '#                                    =(^.^)=                                   #', FIM_TEXTO
LINE20			STR     '#                                                                              #', FIM_TEXTO
LINE21			STR     '#______________________________________________________________________________#', FIM_TEXTO
LINE22			STR     '# LIFE: ^ ^ ^                                                                  #', FIM_TEXTO
LINE23			STR     '################################################################################', FIM_TEXTO

LOSE0			STR     '################################################################################', FIM_TEXTO
LOSE1			STR     '#                                                                              #', FIM_TEXTO
LOSE2			STR     '#                                                                              #', FIM_TEXTO
LOSE3			STR     '#                                                                              #', FIM_TEXTO
LOSE4			STR     '#    GGGGGG  AAAAAA MM     MM EEEEEE     OOOOOO V         V EEEEEE RRRRRR      #', FIM_TEXTO
LOSE5			STR     '#    G       A    A M M   M M E          O    O  V       V  E      R    R      #', FIM_TEXTO
LOSE6			STR     '#    G       A    A M  M M  M E          O    O   V     V   E      RRRRRR      #', FIM_TEXTO
LOSE7			STR     '#    G  GGG  AAAAAA M   M   M EEE        O    O    V   V    EEE    R  R        #', FIM_TEXTO
LOSE8			STR     '#    G    G  A    A M       M E          O    O     V V     E      R   R       #', FIM_TEXTO
LOSE9			STR     '#    GGGGGG  A    A M       M EEEEEE     OOOOOO      V      EEEEEE R    R      #', FIM_TEXTO
LOSE10			STR     '#                                                                              #', FIM_TEXTO
LOSE11			STR     '#                                                                              #', FIM_TEXTO
LOSE12			STR     '#                                                                              #', FIM_TEXTO
LOSE13			STR     '#                                SCORE: 0000                                   #', FIM_TEXTO
LOSE14			STR     '#                                                                              #', FIM_TEXTO
LOSE15			STR     '#                                                                              #', FIM_TEXTO
LOSE16			STR     '#                                                                              #', FIM_TEXTO
LOSE17			STR     '#                                                                              #', FIM_TEXTO
LOSE18			STR     '#                                                                              #', FIM_TEXTO
LOSE19			STR     '#                                                                              #', FIM_TEXTO
LOSE20			STR     '#                                                                              #', FIM_TEXTO
LOSE21			STR     '#______________________________________________________________________________#', FIM_TEXTO
LOSE22			STR     '#                                                                              #', FIM_TEXTO
LOSE23			STR     '################################################################################', FIM_TEXTO

WIN00			STR     '################################################################################', FIM_TEXTO
WIN01			STR     '#                                                                              #', FIM_TEXTO
WIN02			STR     '#                                                                              #', FIM_TEXTO
WIN03			STR     '#                                                                              #', FIM_TEXTO
WIN04			STR     '#                Y     Y OOOOOO U    U      W       W  I  N    N               #', FIM_TEXTO
WIN05			STR     '#                 Y   Y  O    O U    U      W       W  I  NN   N               #', FIM_TEXTO
WIN06			STR     '#                  Y Y   O    O U    U      W   W   W  I  N N  N               #', FIM_TEXTO
WIN07			STR     '#                   Y    O    O U    U      W  W W  W  I  N  N N               #', FIM_TEXTO
WIN08			STR     '#                   Y    O    O U    U      W W   W W  I  N   NN               #', FIM_TEXTO
WIN09			STR     '#                   Y    OOOOOO UUUUUU      WW     WW  I  N    N               #', FIM_TEXTO
WIN010			STR     '#                                                                              #', FIM_TEXTO
WIN011			STR     '#                                                                              #', FIM_TEXTO
WIN012			STR     '#                       LIVES REMAINING: 1000x0                                #', FIM_TEXTO
WIN013			STR     '#                                                                              #', FIM_TEXTO
WIN014			STR     '#                                 SCORE: 0000                                  #', FIM_TEXTO
WIN015			STR     '#                                                                              #', FIM_TEXTO
WIN016			STR     '#                           TOTAL SCORE: 0000                                  #', FIM_TEXTO
WIN017			STR     '#                                                                              #', FIM_TEXTO
WIN018			STR     '#                                                                              #', FIM_TEXTO
WIN019			STR     '#                                                                              #', FIM_TEXTO
WIN020			STR     '#                                                                              #', FIM_TEXTO
WIN021			STR     '#______________________________________________________________________________#', FIM_TEXTO
WIN022			STR     '#                                                                              #', FIM_TEXTO
WIN023			STR     '################################################################################', FIM_TEXTO

NavePosX        WORD    40d
NavePosY  		WORD    19d

LineLenght		WORD	81d

Space			STR     ' '
Nave            STR     '=(^.^)=', FIM_TEXTO

Bullet          STR 	'^', FIM_TEXTO
BulletY			WORD    18d
BulletX 		WORD    0d
BulletExist		WORD    0d

EnemyDirection  WORD    ENEMY_RIGHT_DIRECTION         
EnemyCursorY    WORD	0d              ; Posição X e Y de um inimigo para impor limites de movimentação
EnemyCursorX    WORD	0d
LastEnemy		WORD	55d
TotalEnemies	WORD	55d

ResetX			WORD 	0d              ; Variaveis de controle para reiniciar valores 
ResetY			WORD	0d
ResetLineNum	WORD    8d

EnemyLineMov	WORD	8d              ; Variaveis de controle para movimentação dos inimigos
LastLine		WORD	8d
FirstLine		WORD	3d

EnemyA 			STR 	'M'

RowIndex		WORD	0d
ColumnIndex		WORD	0d
TextIndex		WORD	0d

ArgPrintString	WORD	0d

TotalLine     	WORD	23d

ScoreValue		WORD	0d

TotalLifes		WORD	3d    
LifeX			WORD	12d
LifeY			WORD	22d

;------------------------------------------------------------------------------
; ZONA II: definicao de tabela de interrupções
;------------------------------------------------------------------------------
                ORIG    FE00h
INT0            WORD    MoveSpaceshipLeft
INT1            WORD    MoveSpaceshipRight
INT2			WORD	SpaceShoot
	
				ORIG    FE0Fh
INT15 			WORD    Timer

;------------------------------------------------------------------------------
; ZONA IV: codigo
;        conjunto de instrucoes Assembly, ordenadas de forma a realizar
;        as funcoes pretendidas
;------------------------------------------------------------------------------
                ORIG    0000h
                JMP     Main

;------------------------------------------------------------------------------
; Rotina de Interrupção Timer
;------------------------------------------------------------------------------
Timer: 	PUSH R1
		PUSH R2


ContinueT: MOV R1, M[BulletExist]
		CMP R1, 0d
		JMP.Z ContinueTimer
 		CALL ShootBullet

ContinueTimer: CALL EnemyMovement
			   CALL SetTimer

		POP R2
		POP R1
		RTI
;------------------------------------------------------------------------------
; Rotina SetTimer
;------------------------------------------------------------------------------
SetTimer:	PUSH R1

			MOV R1, 1d                ; 1 ms
			MOV M[ TIMER_UNITS ], R1

			MOV R1, ON
			MOV M[ ACTIVATE_TIMER ], R1

			POP R1

			RET
;------------------------------------------------------------------------------
; Rotina de Interrupção ShootBullet
;------------------------------------------------------------------------------
SpaceShoot: CALL ShootBullet

			RTI
;------------------------------------------------------------------------------
; Rotina de Interrupção MoveSpaceshipLeft
;------------------------------------------------------------------------------
MoveSpaceshipLeft: CALL NaveMovEsq

				   RTI
;------------------------------------------------------------------------------
; Rotina de Interrupção MoveSpaceshipRight
;------------------------------------------------------------------------------
MoveSpaceshipRight: CALL NaveMovDir

					RTI
;------------------------------------------------------------------------------
; ShootBullet - Faz a nave atirar, colidir com o inimigo e o remover da memória
;------------------------------------------------------------------------------
ShootBullet: PUSH R1
			 PUSH R2
			 PUSH R3

			 MOV R1, 1d                 ; Atribui que a bala existe
			 MOV M[BulletExist], R1

			 MOV R1, M[BulletX]
			 CMP R1, 0d               ; Verifica qual a posição da bala, caso seja zero colocar logo acima da nave
			 JMP.NZ ContinueBullet
			 MOV R1, M[NavePosX]
			 MOV M[BulletX], R1
			 MOV R1, M[BulletY]
			 MOV R2, M[BulletX]
			 SHL R1, ROW_SHIFT
			 OR R1, R2
			 MOV M[CURSOR], R1
			 MOV R2, M[Bullet]
			 MOV M[IO_WRITE], R2
			 DEC M[BulletY]
			 JMP BulletEnd

ContinueBullet: MOV R1, M[BulletY]
			 INC R1
			 MOV R2, M[BulletX]
			 SHL R1, ROW_SHIFT
			 OR R1, R2
			 MOV M[CURSOR], R1
			 MOV R2, M[Space]
			 MOV M[IO_WRITE], R2

			 MOV R3, 2d           ; Verifica se chegou na borda do mapa
			 MOV R2, M[BulletX]
			 SHL R3, ROW_SHIFT
			 OR R3, R2
			 CMP R1, R3
			 JMP.Z ResetPos
			 JMP ColideCheck

ColideCheck: MOV R1, M[LineLenght]
			 MOV R3, M[BulletY]
			 DEC R3
			 MOV R2, M[LineLenght]
			 JMP ColideSum

ColideSum:   ADD R2, R1
			 DEC R3
			 CMP R3, 0d          ; Verifica se o loop da soma chegou ao fim
			 JMP.NZ ColideSum
			 JMP ColideContinue

ColideContinue: MOV R3, M[BulletX]
			 ADD R2, R3
			 MOV R1, LINE0
			 ADD R1, R2
			 MOV R3, R1

		     MOV R2, M[R1]
		     MOV R1, M[Space]
		     CMP R1, R2
		     JMP.Z ContinuePos
		     JMP Colide

Colide:		 MOV R1, M[BulletY]
		     MOV R2, M[BulletX]
		     SHL R1, ROW_SHIFT
		     OR R1, R2
		     MOV M[CURSOR], R1
		     MOV R2, M[Space]
		     MOV M[IO_WRITE], R2
		     MOV M[R3], R2
		     CALL Score                     ; ATUALIZA O VALOR DO SCORE
		     JMP ResetPos

ContinuePos: MOV R1, M[BulletY]
			 MOV R2, M[BulletX]
			 SHL R1, ROW_SHIFT
			 OR R1, R2
			 MOV M[CURSOR], R1
			 MOV R2, M[Bullet]
			 MOV M[IO_WRITE], R2
			 DEC M[BulletY]
			 JMP BulletEnd

ResetPos:    MOV R1, 18d           ; Onde a bala incia
		     MOV M[BulletY], R1
		     MOV R1, 0d            ; Necessita ser zero para entrar na comparação no inicio da função
		     MOV M[BulletX], R1
		     MOV M[BulletExist], R1
			 JMP BulletEnd

BulletEnd:   POP R3
			 POP R2	
			 POP R1
			 RET

;------------------------------------------------------------------------------
; Score - Se a bala colidir, significa que matou um inimigo logo é necessário atualizar o Score
; Nesta parte do código, ele atualiza o valor em ScoreValue e faz divisões por 10/100/1000 para pegar cada número correspondente a sua casa decimal e printar na tela
;------------------------------------------------------------------------------
Score:	    PUSH R1
			PUSH R2 
			PUSH R3
			PUSH R4

		    MOV  R1, M[ScoreValue] 
		    ADD  R1, 25d                ; Valor ao matar cada inimigo
		    MOV  M[ScoreValue], R1

		    MOV  R2, 1000d               ; Os valores decimais abaixo representam a posição na tela X e Y onde é escrito o score
			DIV  R1, R2

			MOV  R3, 1d
			MOV  R4, 9d 
			SHL  R3, ROW_SHIFT
			OR   R3, R4
			MOV  M[CURSOR], R3
			ADD  R1, 48d
			MOV  M[IO_WRITE], R1

			MOV  R1, 100d
			DIV  R2, R1

			MOV  R3, 1d
			MOV  R4, 10d 
			SHL  R3, ROW_SHIFT
			OR   R3, R4
			MOV  M[CURSOR], R3
			ADD  R2, 48d
			MOV  M[IO_WRITE], R2

			MOV  R2, 10d 
			DIV  R1, R2

			MOV  R3, 1d
			MOV  R4, 11d 
			SHL  R3, ROW_SHIFT
			OR   R3, R4
			MOV  M[CURSOR], R3
			ADD  R1, 48d
			MOV  M[IO_WRITE], R1
			INC  R3
			MOV  M[CURSOR], R3
			ADD  R2, 48d
			MOV  M[IO_WRITE], R2
			CALL YouWinCase        ; DIMINUI QUANTIDADE DE INIMIGOS E VÊ SE O JOGO ACABOU

EndScore:	POP R4
			POP R3
			POP R2
			POP R1
			RET
;------------------------------------------------------------------------------
; YouWin - Reduz a quantidade de inimigos vivos e caso seja 0, vá para tela de vitória.
;Sempre que tem uma colisão, é feito um decréssimo na quantidade de inimigos e, caso chegue a zero, printa a tela de vitória.
;------------------------------------------------------------------------------
YouWinCase:  PUSH R1
			 PUSH R2
			 PUSH R3
			 PUSH R4

			 MOV R1, M[TotalEnemies]
			 DEC R1
			 CMP R1, 0d 
			 JMP.Z YouWin
			 MOV M[TotalEnemies], R1
			 JMP YWNOTYET                        ; Se a quantidade de inimigos não for zero, o jogador ainda não ganhou

YouWin:		MOV R3, 0d
			MOV M[RowIndex],R3
			MOV R1, WIN00
			MOV M[ArgPrintString], R1
			CALL PrintString

YWBoard:   	CMP R3, M[TotalLine]
			JMP.Z YWSocre
			ADD R1, M[LineLenght]
			MOV M[ArgPrintString], R1
			CALL PrintString
			INC R3
			JMP YWBoard

YWSocre:	MOV R1, 12d                            ; Faz a mesma função do score, porém numa posição diferente da tela de vitória
			SHL R1, ROW_SHIFT
			MOV R2, 46d							  ; Os valores decimais abaixo representam a posição na tela X e Y onde é escrito o score
			OR R1, R2
			MOV M[CURSOR],R1
			MOV R1, M[TotalLifes]
			ADD R1, 48d
			MOV M[IO_WRITE], R1
			MOV R1, M[ScoreValue] ;; score
		    MOV R2, 1000d
			DIV R1, R2
			MOV R3, 14d
			MOV R4, 41d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R1, 48d
			MOV M[IO_WRITE], R1
			MOV R1, 100d
			DIV R2, R1
			MOV R3, 14d
			MOV R4, 42d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R2, 48d
			MOV M[IO_WRITE], R2
			MOV R2, 10d 
			DIV R1, R2
			MOV R3, 14d
			MOV R4, 43d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R1, 48d
			MOV M[IO_WRITE], R1
			INC R3
			MOV M[CURSOR], R3
			ADD R2, 48d
			MOV M[IO_WRITE], R2
			MOV R1, M[ScoreValue]
			MOV R2, M[TotalLifes]

     		MOV R3, 1000d
			MUL R3, R2
			ADD R1, R2

YWEnd:		MOV R2, 1000d
			DIV R1, R2
			MOV R3, 16d
			MOV R4, 41d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R1, 48d
			MOV M[IO_WRITE], R1
			MOV R1, 100d
			DIV R2, R1
			MOV R3, 16d
			MOV R4, 42d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R2, 48d
			MOV M[IO_WRITE], R2
			MOV R2, 10d 
			DIV R1, R2
			MOV R3, 16d
			MOV R4, 43d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R1, 48d
			MOV M[IO_WRITE], R1
			INC R3
			MOV M[CURSOR], R3
			ADD R2, 48d
			MOV M[IO_WRITE], R2
			MOV R1, M[ScoreValue]
			MOV R2, M[TotalLifes]
			JMP Halt                     ; Pula para o Halt finalizando o programa

YWNOTYET:	POP R4
			POP R3
			POP R2
			POP R1
			RET

;------------------------------------------------------------------------------
; Game Over - Printa a tela de GameOver e o Score em um lugar diferente
;------------------------------------------------------------------------------

GameOver:   PUSH R1	
		    PUSH R2
		    PUSH R3
		    PUSH R4

			MOV R3, 0d
			MOV M[RowIndex],R3
			MOV R1, LOSE0
			MOV M[ArgPrintString], R1
			CALL PrintString

GOBoard:   	CMP R3, M[TotalLine]							; Printa o board de GameOver
			JMP.Z GOScore
			ADD R1, M[LineLenght]
			MOV M[ArgPrintString], R1
			CALL PrintString
			INC R3
			JMP GOBoard

GOScore:	MOV R1, M[ScoreValue]                           ; Printa o Score de GameOver com a mesma lógica do score de You Win
		    MOV R2, 1000d									; Os valores decimais abaixo representam a posição na tela X e Y onde é escrito o score
			DIV R1, R2

			MOV R3, 13d
			MOV R4, 41d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R1, 48d
			MOV M[IO_WRITE], R1

			MOV R1, 100d
			DIV R2, R1

			MOV R3, 13d
			MOV R4, 42d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R2, 48d
			MOV M[IO_WRITE], R2

			MOV R2, 10d 
			DIV R1, R2

			MOV R3, 13d
			MOV R4, 43d 
			SHL R3, ROW_SHIFT
			OR R3, R4
			MOV M[CURSOR], R3
			ADD R1, 48d
			MOV M[IO_WRITE], R1
			INC R3
			MOV M[CURSOR], R3
			ADD R2, 48d
			MOV M[IO_WRITE], R2

			POP R4
			POP R3
			POP R2
			POP R1
			JMP Halt                                   ; Finaliza o programa indo para halt

;------------------------------------------------------------------------------
; EnemyMovement - Nesta parte o inimigo se mexe para direita
;------------------------------------------------------------------------------
EnemyMovement: PUSH R1
			   PUSH R2
			   PUSH R3
			   PUSH R4
			   PUSH R5

			   MOV R1, M[LastLine]
			   MOV M[EnemyLineMov], R1
			   MOV R1, ENEMY_RIGHT_DIRECTION
			   CMP R1, M[EnemyDirection]
			   JMP.NZ  EsqCheck                      ; Verifica para qual sentido está indo
			   MOV R1, 75d							;75 é a borda de até onde o inimigo pode se movimentar
			   CMP R1, M[LastEnemy]					 ; Verifica se chegou na borda e precisa mover para baixo
			   JMP.Z MovDown
			   MOV R1, M[EnemyLineMov]
			   MOV M[EnemyCursorY], R1
			   MOV R1, 1d                        ; Reseta a posição do enemy cursor para o inicio da linha
			   MOV M[EnemyCursorX], R1
			   MOV R1, LINE0
			   MOV R3, M[LastLine]

LopMovSoma:	   ADD R1, M[LineLenght]							 ; Utilizado para verificar qual a última linha de inimigos e saber sua posição na memória
			   DEC R3
			   CMP R3, 0d                   ; Verifica se o loop de soma terminou
			   JMP.NZ LopMovSoma
			   MOV R2, M[EnemyCursorX]
			   ADD R1,R2
			   JMP EnemyLoop
			   MOV R2, M[EnemyCursorX]
			   ADD R1,R2
			   JMP EnemyLoop

EnemyLoop:	   MOV R2, M[Space]                      ; Anda espaço por espaço até achar algo que seja diferente de vazio, ou seja, até encontrar um inimigo
			   MOV R3, M[R1]
			   CMP R2, R3
			   JMP.NZ EnemyFound
			   INC R1
			   MOV R2, M[EnemyCursorX]
			   INC R2
			   MOV M[EnemyCursorX], R2
			   MOV R2, M[EnemyCursorX]
			   CMP R2, 76d
			   JMP.Z EnemyEnd                       ; Aqui verifica se já está no final da linha e necessita passar para a próxima
			   JMP EnemyLoop

EnemyFound:    MOV R2, M[EnemyCursorY]              ; Ao encontrar o inimigo, o remove da tela e da memoria na posição X e o adiciona na tela e memória na posição X+1
			   SHL R2, ROW_SHIFT
			   MOV R3, M[EnemyCursorX]
			   OR R2,R3
			   MOV M[CURSOR], R2
			   MOV R2, M[Space]
			   MOV M[R1], R2
			   MOV M[IO_WRITE], R2
			   MOV R3, M[EnemyCursorX]
			   INC R3
			   MOV M[EnemyCursorX], R3
			   MOV R2, M[EnemyCursorY]
			   SHL R2, ROW_SHIFT
			   MOV R3, M[EnemyCursorX]
			   OR R2,R3
			   MOV M[CURSOR], R2
			   MOV R2, M[EnemyA]
			   MOV M[IO_WRITE], R2
			   INC R1
			   MOV M[R1], R2
			   INC R1
			   MOV R2, M[EnemyCursorX]
			   INC R2
			   MOV M[EnemyCursorX], R2
			   JMP EnemyLoop

EnemyEnd:	   MOV R2, M[EnemyLineMov]
			   DEC R2
			   CMP R2, M[FirstLine] 
			   JMP.Z ResetLine
			   MOV M[EnemyLineMov], R2
			   MOV R1, M[EnemyLineMov]
			   MOV M[EnemyCursorY], R1
			   MOV R1, 1d                 ; Reseta para o inicio da linha o cursor do inimigo
			   MOV M[EnemyCursorX], R1
			   MOV R3, M[EnemyLineMov]
			   MOV R1, LINE0

MovSoma:	   ADD R1, M[LineLenght]
			   DEC R3
			   CMP R3, 0d                           ; Compara para ver se chegou no final do loop de soma
			   JMP.NZ MovSoma
			   MOV R2, M[EnemyCursorX]
			   ADD R1,R2
			   JMP EnemyLoop

ResetLine:	   MOV R2, M[LastLine]                     ; O ResetLine serve para verificar qual linha do inimigo que está se movendo, então utiliza-se como base a linha final
			   MOV M[EnemyLineMov], R2                 ; e ela vai sendo decrementada até chegar na primeira linha (os inimigos se mexem na ordem de debaixo para cima)
			   										   ; então, ao final na movimentação é necessário atualizar os valores de onde estão os inimigos e os parametros para sua movimentação
			   MOV R2, M[LastEnemy]
			   INC R2
			   MOV M[LastEnemy], R2

FinalEnemyEnd: POP R5              ; O POP ESTÁ AQUI POIS AS FUNÇÕES ABAIXO FAZEM PARTE DO ENEMY MOVMENT, MUDANDO APENAS O SENTIDO (OU DIREÇÃO)
			   POP R4			   ; LOGO É A MESMA LÓGICA, APENAS INVERTENDO OS VALORES QUE SEMPRE ACABA AQUI
			   POP R3
			   POP R2
			   POP R1
			   RET
;------------------------------------------------------------------------------
; EnemyMovement Parte 2 - Verifica a possibilidade dos inimigos se movimentarem para baixo ou então resetar a posição
;------------------------------------------------------------------------------
MovDown:	   MOV R1, LINE0
			   MOV R3, M[LastLine]
			   CMP R3, 18d         ; o 18d representa o a última linha que o inimigo pode chegar, na mesma linha da nave
			   JMP.NZ DLopMovSoma  ; Aqui verifica se é necessário resetar a posição dos inimigos pois colidirá com a nave

;------------------------------------------------------------------------------
; Reseta a posição dos inimigos para o centro
;------------------------------------------------------------------------------
			   MOV R1, M[LastLine]
			   MOV M[EnemyCursorY], R1
			   MOV R1, 44d                       ; é a posição do inimigo mais a esquerda logo antes de ocorrer a colisão dos inimigos com a nave
			   MOV M[EnemyCursorX], R1
			   MOV R1, LINE0
			   MOV R2, LINE0
			   MOV R3, M[LastLine]
			   MOV R5, M[ResetLineNum]
			   MOV R4, 8d                         ; Linha dos inimigos onde eles começam na posição inicial
			   MOV M[ResetY], R4
			   MOV R4, 24d						; Coluna dos inimigos onde eles começam na posição inicial
			   MOV M[ResetX], R4 

RLopMovSoma:   ADD R1, M[LineLenght]
			   DEC R3
			   CMP R3, 0d                 ; Verifica se chegou ao fim o loop da soma
			   JMP.NZ RLopMovSoma
			   MOV R4, M[EnemyCursorX]
			   ADD R1,R4
			   MOV R4, 24d                  ; Coluna dos inimigos onde eles começam na posição inicial
			   MOV M[ResetX], R4 

RLopMovSoma2:  ADD R2, M[LineLenght]
			   DEC R5
			   CMP R5, 0d                 ; Verifica se chegou ao fim o loop da soma
			   JMP.NZ RLopMovSoma2
			   MOV R5, M[ResetX]
			   ADD R2, R5

REnemyLoop:	   MOV R3, M[R1]
			   MOV R4, M[ResetY]
			   SHL R4, ROW_SHIFT
			   MOV R5, M[ResetX]
			   OR R4, R5
			   MOV M[CURSOR], R4
			   MOV M[IO_WRITE], R3
			   MOV M[R2], R3
			   INC R2
			   MOV R4, M[EnemyCursorY]
			   SHL R4, ROW_SHIFT
			   MOV R5, M[EnemyCursorX]
			   OR R4, R5
			   MOV M[CURSOR], R4
			   MOV R5, M[Space]
			   MOV M[IO_WRITE], R5
			   MOV M[R1], R5
			   MOV R5, M[EnemyCursorX]
			   INC R5
			   MOV M[EnemyCursorX], R5
			   INC R1
			   MOV R4, M[ResetX]
			   INC R4
			   CMP R4, 56d             ; verifica se já resetou toda a linha para o centro do mapa
			   JMP.Z PreviousLine
			   MOV M[ResetX], R4
			   JMP REnemyLoop

PreviousLine:  MOV R4, M[LastLine]
			   DEC R4
			   CMP R4, M[FirstLine]
			   JMP.Z ResetValues
			   MOV M[LastLine], R4
			   MOV R4, M[ResetLineNum]
			   DEC R4
			   MOV M[ResetLineNum], R4
			   MOV R1, LINE0
			   MOV R3, M[LastLine]
			   MOV R4, M[ResetY]
			   DEC R4
			   MOV M[ResetY], R4
			   MOV R5, 44d              ; posição na coluna do inimigo ao começar o jogo (para resetar)
			   MOV M[EnemyCursorX], R5
			   MOV R5, M[EnemyCursorY]
			   DEC R5
			   MOV M[EnemyCursorY], R5
			   MOV R4, 25d             ; posição na linha do inimigo ao começar o jogo (para resetar)
			   MOV M[ResetX], R4
			   MOV R2, LINE0
			   MOV R5, M[ResetLineNum]
			   JMP RLopMovSoma

ResetValues:   MOV R4, 8d                 ; volta as variaveis para os valores originais ao começar o jogo
			   MOV M[ResetLineNum], R4
			   MOV M[LastLine], R4
			   MOV M[EnemyLineMov], R4
			   MOV R4, 3d 
			   MOV M[FirstLine], R4
			   MOV R4, 55d                   ; Posição do inimigo mais a direita
			   MOV M[LastEnemy], R4
			   MOV R4, ENEMY_RIGHT_DIRECTION
			   MOV M[EnemyDirection], R4

;------------------------------------------------------------------------------
; Jogador perde uma vida, pois os inimigos colidiram com a nave.
;------------------------------------------------------------------------------
			   MOV R4, M[TotalLifes]
			   DEC R4
			   CMP R4, 0d           ; Compara se a quantidade de vidar chegou a zero para chegar em GameOver
			   JMP.NZ NotGameOver
			   CALL GameOver

NotGameOver:   MOV M[TotalLifes],R4
			   MOV R1, M[LifeY]
			   SHL R1, ROW_SHIFT
			   MOV R2, M[LifeX]
			   OR R1, R2
			   MOV M[CURSOR], R1
			   MOV R1, M[Space]
			   MOV M[IO_WRITE], R1
			   SUB R2, 2d            ; Ajusta a posição de onde está localizado o caracter que representa a vida
			   MOV M[LifeX], R2
			   JMP FinalEnemyEnd

;------------------------------------------------------------------------------
; Movimentação para baixo
;------------------------------------------------------------------------------

DLopMovSoma: MOV R2, M[LineLenght]
			 MUL R3, R2 
			 ADD R1, R2

			MOV R2, 1d ; inicia o cursor de onde tem inimigo para o inicio da linha para verificar onde tem inimigo
			MOV M[EnemyCursorX], R2 
			ADD R1,R2
			MOV R2, M[LastLine] 
			MOV M[EnemyCursorY], R2

			JMP EnemyLDown

EnemyLDown: MOV R2, M[Space]
			MOV R3, M[R1]

			CMP R2, R3
			JMP.NZ EnemyFDown
			INC R1
			MOV R2, M[EnemyCursorX]
			INC R2
			MOV M[EnemyCursorX], R2
			MOV R2, M[EnemyCursorX]
			CMP R2, 76d
			JMP.Z EnemyDEnd                 ; verifica se chegou na borda
			JMP EnemyLDown

EnemyFDown: MOV R2, M[EnemyCursorY]
			SHL R2, ROW_SHIFT
			MOV R3, M[EnemyCursorX]
			OR R2,R3
			MOV M[CURSOR], R2
			MOV R2, M[Space]
			MOV M[R1], R2
			MOV M[IO_WRITE], R2
			MOV R3, M[EnemyCursorY]
			INC R3
			MOV M[EnemyCursorY], R3
			MOV R2, M[EnemyCursorX]
			SHL R3, ROW_SHIFT
			MOV R2, M[EnemyCursorX]
			OR R3,R2
			MOV M[CURSOR], R3
			MOV R2, M[EnemyA]
			MOV M[IO_WRITE], R2
			ADD R1, M[LineLenght]
			MOV M[R1], R2
			INC R1
			SUB R1, M[LineLenght]
			MOV R2, M[EnemyCursorX]
			INC R2
			MOV M[EnemyCursorX], R2
			MOV R3, M[EnemyCursorY]
			DEC R3
			MOV M[EnemyCursorY], R3
			JMP EnemyLDown

EnemyDEnd: 	MOV R2, M[EnemyLineMov]
			DEC R2
			CMP R2, M[FirstLine] 
			JMP.Z SwitchDir
			MOV M[EnemyLineMov], R2

			MOV R1, M[EnemyLineMov]
			MOV M[EnemyCursorY], R1
			MOV R1, 1d                       ; inicia o cursor na posição mais a esquerda para varrer onde tem inimigo no proximo loop
			MOV M[EnemyCursorX], R1

			MOV R3, M[EnemyLineMov]
			MOV R1, LINE0

MovSDown:	ADD R1, M[LineLenght]
			DEC R3
			CMP R3, 0d         ; verifica se chegou ao final do loop de soma
			JMP.NZ MovSDown

			MOV R2, M[EnemyCursorX]
			ADD R1,R2
			JMP EnemyLDown

SwitchDir:	MOV R1, ENEMY_RIGHT_DIRECTION
			CMP R1, M[EnemyDirection]
			JMP.NZ SwitchDir2
			MOV R1, ENEMY_LEFT_DIRECTION
			MOV M[EnemyDirection], R1
			MOV R1, M[LastLine]
			INC R1
			MOV M[LastLine], R1
			MOV R1, M[FirstLine]
			INC R1
			MOV M[FirstLine], R1
			JMP FinalEnemyEnd

SwitchDir2:	MOV R1, ENEMY_RIGHT_DIRECTION
			MOV M[EnemyDirection], R1
			MOV R1, M[LastLine]
			INC R1
			MOV M[LastLine], R1
			MOV R1, M[FirstLine]
			INC R1
			MOV M[FirstLine], R1
			JMP FinalEnemyEnd
;------------------------------------------------------------------------------
; EnemyMovement Parte 3 - Nesta parte o inimigo se mexe para esquerda OBS: como é uma continuação do EnemyMoviment, não há PUSH nem POP
;------------------------------------------------------------------------------

EsqCheck:		MOV R1, 35d               ; compara se o inimigo mais a direita (morto ou não) chegou na borda da esquerda para iniciar o movimento para baixo
				CMP R1, M[LastEnemy]
			    JMP.Z MovDown

			   MOV R1, M[LastLine]
			   MOV M[EnemyCursorY], R1
			   MOV R1, 78d                  ; Começa a varrer da posição mais a direita da linha até a mais a esquerda para verificar onde tem inimigos
			   MOV M[EnemyCursorX], R1

			   MOV R1, LINE0
			   MOV R3, M[LastLine]
			   MOV R2, M[LineLenght]
			   MUL R3, R2
			   ADD R1, R2

			   MOV R2, M[EnemyCursorX]
			   ADD R1,R2

EEnemyLoop:	   MOV R2, M[Space]
			   MOV R3, M[R1]

			   CMP R2, R3
			   JMP.NZ EEnemyFound
			   DEC R1
			   MOV R2, M[EnemyCursorX]
			   DEC R2
			   MOV M[EnemyCursorX], R2
			   MOV R2, M[EnemyCursorX]
			   CMP R2, 2d                   ; compara se já termionu de varrer a linha
			   JMP.Z EEnemyEnd
			   JMP EEnemyLoop

EEnemyFound:   MOV R2, M[EnemyCursorY]
			   SHL R2, ROW_SHIFT
			   MOV R3, M[EnemyCursorX]
			   OR R2,R3
			   MOV M[CURSOR], R2
			   MOV R2, M[Space]
			   MOV M[R1], R2
			   MOV M[IO_WRITE], R2
			   MOV R3, M[EnemyCursorX]
			   DEC R3
			   MOV M[EnemyCursorX], R3
			   MOV R2, M[EnemyCursorY]
			   SHL R2, ROW_SHIFT
			   MOV R3, M[EnemyCursorX]
			   OR R2,R3
			   MOV M[CURSOR], R2
			   MOV R2, M[EnemyA]
			   MOV M[IO_WRITE], R2
			   DEC R1
			   MOV M[R1], R2
			   DEC R1
			   MOV R2, M[EnemyCursorX]
			   DEC R2
			   MOV M[EnemyCursorX], R2
			   JMP EEnemyLoop

EEnemyEnd:	   MOV R2, M[EnemyLineMov] 
			   DEC R2
			   CMP R2, M[FirstLine]                      ; Verifica se a última linha de inimigos já se movimentou uma vez
			   JMP.Z EResetLine
			   MOV M[EnemyLineMov], R2                   ; Se não for a última linha, ele muda o EnemyLiveMov para mexer a próxima linha e volta o código para EEnemyLoop 
			   MOV R1, M[EnemyLineMov]
			   MOV M[EnemyCursorY], R1
			   MOV R1, 78d                              ; borda da parede da direita
			   MOV M[EnemyCursorX], R1
			   MOV R3, M[EnemyLineMov]
			   MOV R1, LINE0
			   MOV R2, M[LineLenght]
			   MUL R3, R2
			   ADD R1, R2

			   MOV R2, M[EnemyCursorX]
			   ADD R1,R2
			   JMP EEnemyLoop

EResetLine:		MOV R2, M[LastLine] 
				MOV M[EnemyLineMov], R2

				MOV R2, M[LastEnemy]
			    DEC R2
			    MOV M[LastEnemy], R2
			    JMP FinalEnemyEnd
;------------------------------------------------------------------------------
; Função NaveMovDir
;------------------------------------------------------------------------------
NaveMovDir:	PUSH R1
			PUSH R2
			PUSH R3
			PUSH R4

			MOV R1, M[NavePosY]
			MOV R2, M[NavePosX]
			ADD R2, 4d             ; Adiciona 4 por causa do tamanho da nave e verifica a colisão
			SHL R1, ROW_SHIFT
			OR  R1, R2
			MOV R3, 19d            ; posição da borda da direita do mapa para testar colisão no CMP
			MOV R2, 78d
			SHL R3, ROW_SHIFT
			OR R3, R2
			CMP R1, R3
			JMP.Z MovDirFim
			MOV R4, 3d
			JMP LoopDir

LoopDir:  	MOV R1, M[NavePosY]
			MOV R2, M[NavePosX]
			SUB R2, R4
			SHL R1, ROW_SHIFT
			OR  R1, R2
			MOV M[ CURSOR ], R1
			MOV R2, M[Space]
		 	MOV M[IO_WRITE], R2
		 	DEC R4
		 	CMP R4, 0d
		 	JMP.Z ContinueDir
		 	JMP LoopDir

ContinueDir:INC M[NavePosX]
			MOV R1, M[NavePosY]
			MOV R2, M[NavePosX]
			SUB R2, 3d             ; Ajusta de acordo com o tamanho da nave
			MOV R4, R2
			SHL R1, ROW_SHIFT
			OR  R1, R2
			MOV M[CURSOR],R1
			MOV R3, Nave
MovDirLoop:	MOV R2, M[R3]
			CMP R2, FIM_TEXTO
			JMP.Z  MovDirFim
			MOV M[IO_WRITE], R2
			INC R3
			INC R4
			MOV R1, M[NavePosY]
			SHL R1, ROW_SHIFT
			OR R1, R4
			MOV M[CURSOR], R1
			JMP MovDirLoop

MovDirFim:	POP R4
			POP R3
			POP R2
			POP R1
			RET
;------------------------------------------------------------------------------
; Função NaveMovEsq
;------------------------------------------------------------------------------

NaveMovEsq:	PUSH R1
			PUSH R2
			PUSH R3
			PUSH R4

			MOV R1, M[NavePosY]
			MOV R2, M[NavePosX]
			SUB R2, 4d                 ; Diminui 4 pelo tamanho da nave (mesma lógica do NaveMovDir) e ver se irá colidir no proximo movimento
			SHL R1, ROW_SHIFT
			OR  R1, R2
			MOV R3, 19d                ; posição da colisão com a parede da esquerda
			MOV R2, 1d
			SHL R3, ROW_SHIFT
			OR R3, R2
			CMP R1, R3
			JMP.Z MovEsqFim
			MOV R4, 3d
			JMP LoopEsq

LoopEsq:	MOV R1, M[NavePosY]
			MOV R2, M[NavePosX]
			ADD R2, 3d               ; aumenta 3 pelo tamanho da nave
			SHL R1, ROW_SHIFT
			OR  R1, R2
			MOV M[ CURSOR ], R1
			MOV R2, M[Space]
			MOV M[IO_WRITE], R2
			DEC R4
			CMP R4, 0d 
		 	JMP.Z ContinueEsq
		 	JMP LoopEsq

ContinueEsq:DEC M[NavePosX]
			MOV R1, M[NavePosY]
			MOV R2, M[NavePosX]
			SUB R2, 3d             ; terminou de imprimir a nave
			MOV R4, R2
			SHL R1, ROW_SHIFT
			OR  R1, R2
			MOV M[CURSOR],R1
			MOV R3, Nave
MovEsqLoop:	MOV R2, M[R3]
			CMP R2, FIM_TEXTO
			JMP.Z  MovDirFim
			MOV M[IO_WRITE], R2
			INC R3
			INC R4
			MOV R1, M[NavePosY]
			SHL R1, ROW_SHIFT
			OR R1, R4
			MOV M[CURSOR], R1
			JMP MovEsqLoop

MovEsqFim:	POP R4
			POP R3
			POP R2
			POP R1
			RET
;------------------------------------------------------------------------------
; Função PrintString - Printa a tela inicial
;------------------------------------------------------------------------------
PrintString: PUSH R1
			 PUSH R2
			 PUSH R3

			 MOV	 R1, 0d                ; posição inicial da coluna
			 MOV	 M[ColumnIndex], R1

			 MOV	 R1, M[ArgPrintString]

PrintStringCycle:    MOV R2, M[R1]
			 CMP 	 R2, FIM_TEXTO
		     JMP.Z 	 PrintStringEnd
			
			 MOV	 R2, M[ ColumnIndex ]
			 MOV	 R3, M[RowIndex]
			 SHL	 R3, ROW_SHIFT
			 OR		 R3, R2
			 MOV	 M[ CURSOR ], R3
			 MOV     R2, M[R1]
			 MOV     M[ IO_WRITE ], R2
		     INC     R1
		     INC	 M[ ColumnIndex ]

		     JMP 	 PrintStringCycle


PrintStringEnd: INC		M[ RowIndex ]
 			 POP	 R3
	 	 	 POP 	 R2
			 POP 	 R1
			 RET

;------------------------------------------------------------------------------
; Função Main
;------------------------------------------------------------------------------
Main:			ENI

				MOV		R1, INITIAL_SP
				MOV		SP, R1		 		; We need to initialize the stack
				MOV		R1, CURSOR_INIT		; We need to initialize the cursor 
				MOV		M[ CURSOR ], R1		; with value CURSOR_INIT

				CALL SetTimer

				MOV R3, 0d              ; Inicializa a quantidade de linhas (de 0 até 23)
				MOV R2, M[LineLenght]

				MOV R1, LINE0
				MOV M[ArgPrintString], R1
				CALL PrintString

Board:			CMP R3, M[TotalLine]
				JMP.Z Cycle
				ADD R1, R2
				MOV M[ArgPrintString], R1
				CALL PrintString
				INC R3
				JMP Board

Cycle: 			BR		Cycle	
Halt:           BR		Halt