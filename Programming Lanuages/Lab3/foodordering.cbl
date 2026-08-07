IDENTIFICATION DIVISION.
PROGRAM-ID. FOODORDERING.
AUTHOR. FRANCISCO.

DATA DIVISION.
WORKING-STORAGE SECTION.

77 WS-CHOICE           PIC 9 VALUE 0.
77 WS-PRICE            PIC 9(5)V99 VALUE 0.
77 WS-TOTAL            PIC 9(5)V99 VALUE 0.
77 WS-DONE             PIC X VALUE 'N'.
77 WS-DISPLAY-TOTAL    PIC Z,ZZ9.99.

PROCEDURE DIVISION.

MAIN-PROGRAM.

	DISPLAY "===================================="
	DISPLAY "     SIMPLE FOOD ORDERING SYSTEM"
	DISPLAY "===================================="

	PERFORM UNTIL WS-DONE = 'Y'

		DISPLAY " "
		DISPLAY "=========== MENU ==========="
		DISPLAY "1. Pizza  - PHP 300.00"
		DISPLAY "2. Burger - PHP 200.00"
		DISPLAY "3. Fries  - PHP 100.00"
		DISPLAY "0. Finish Order"

		DISPLAY "Enter Choice: "
		ACCEPT WS-CHOICE

		IF WS-CHOICE = 1
			MOVE 300 TO WS-PRICE
			ADD WS-PRICE TO WS-TOTAL
			DISPLAY "Pizza added to your order"

		ELSE
			IF WS-CHOICE = 2
				MOVE 200 TO WS-PRICE
				ADD WS-PRICE TO WS-TOTAL
				DISPLAY "Burger added to your order"

			ELSE
				IF WS-CHOICE = 3
					MOVE 100 TO WS-PRICE
					ADD WS-PRICE TO WS-TOTAL
					DISPLAY "Fries added to your order"

				ELSE
					IF WS-CHOICE = 0
						MOVE 'Y' TO WS-DONE
					ELSE
						DISPLAY "Invalid Choice!"
					END-IF
				END-IF
			END-IF
		END-IF

	END-PERFORM.

	MOVE WS-TOTAL TO WS-DISPLAY-TOTAL

	DISPLAY " "
	DISPLAY "============================"
	DISPLAY "      ORDER SUMMARY"
	DISPLAY "============================"
	DISPLAY "Total Amount : PHP " WS-DISPLAY-TOTAL
	DISPLAY "Thank you for ordering!"

	STOP RUN.
	
