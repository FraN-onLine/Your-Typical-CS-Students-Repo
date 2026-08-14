IDENTIFICATION DIVISION.
PROGRAM-ID. FOODORDERING.
AUTHOR. FRANCISCO.

DATA DIVISION.
WORKING-STORAGE SECTION.

77 WS-CHOICE           PIC 9 VALUE 0.
77 WS-PRICE            PIC 9(5)V99 VALUE 0.
77 WS-TOTAL            PIC 9(5)V99 VALUE 0.
77 WS-FUNDS            PIC 9(5)V99 VALUE 1000.00.
77 WS-DONE             PIC X VALUE 'N'.

77 WS-DISPLAY-PRICE    PIC Z,ZZ9.99.
77 WS-DISPLAY-TOTAL    PIC Z,ZZ9.99.
77 WS-DISPLAY-FUNDS    PIC Z,ZZ9.99.

77 WS-ORDER-LIST       PIC X(500) VALUE SPACES.
77 WS-ORDER-PTR        PIC 9(3) VALUE 1.

PROCEDURE DIVISION.

MAIN-PROGRAM.

    DISPLAY "===================================="
    DISPLAY "     SIMPLE FOOD ORDERING SYSTEM"
    DISPLAY "===================================="
    DISPLAY "Starting Funds: PHP 1,000.00"
    DISPLAY " "

    PERFORM UNTIL WS-DONE = 'Y'

        MOVE WS-FUNDS TO WS-DISPLAY-FUNDS

        DISPLAY " "
        DISPLAY "=========== MENU ==========="
        DISPLAY "1. Pizza  - PHP 300.00"
        DISPLAY "2. Burger - PHP 200.00"
        DISPLAY "3. Fries  - PHP 100.00"
        DISPLAY "0. Finish Order"
        DISPLAY "============================"
        DISPLAY "Remaining Funds: PHP " WS-DISPLAY-FUNDS
        DISPLAY "Enter Choice: "
        ACCEPT WS-CHOICE

        IF WS-CHOICE = 1

            MOVE 300.00 TO WS-PRICE

            IF WS-PRICE <= WS-FUNDS

                SUBTRACT WS-PRICE FROM WS-FUNDS
                ADD WS-PRICE TO WS-TOTAL

                STRING
                    "Pizza"
                    DELIMITED BY SIZE
                    ", "
                    DELIMITED BY SIZE
                    INTO WS-ORDER-LIST
                    WITH POINTER WS-ORDER-PTR
                END-STRING

                DISPLAY "Pizza added to your order."

            ELSE
                DISPLAY "Insufficient funds!"
                DISPLAY "Pizza costs PHP 300.00."
            END-IF

        ELSE

            IF WS-CHOICE = 2

                MOVE 200.00 TO WS-PRICE

                IF WS-PRICE <= WS-FUNDS

                    SUBTRACT WS-PRICE FROM WS-FUNDS
                    ADD WS-PRICE TO WS-TOTAL

                    STRING
                        "Burger"
                        DELIMITED BY SIZE
                        ", "
                        DELIMITED BY SIZE
                        INTO WS-ORDER-LIST
                        WITH POINTER WS-ORDER-PTR
                    END-STRING

                    DISPLAY "Burger added to your order."

                ELSE
                    DISPLAY "Insufficient funds!"
                    DISPLAY "Burger costs PHP 200.00."
                END-IF

            ELSE

                IF WS-CHOICE = 3

                    MOVE 100.00 TO WS-PRICE

                    IF WS-PRICE <= WS-FUNDS

                        SUBTRACT WS-PRICE FROM WS-FUNDS
                        ADD WS-PRICE TO WS-TOTAL

                        STRING
                            "Fries"
                            DELIMITED BY SIZE
                            ", "
                            DELIMITED BY SIZE
                            INTO WS-ORDER-LIST
                            WITH POINTER WS-ORDER-PTR
                        END-STRING

                        DISPLAY "Fries added to your order."

                    ELSE
                        DISPLAY "Insufficient funds!"
                        DISPLAY "Fries costs PHP 100.00."
                    END-IF

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

    MOVE WS-TOTAL TO WS-DISPLAY-TOTAL.
    MOVE WS-FUNDS TO WS-DISPLAY-FUNDS.

    DISPLAY " "
    DISPLAY "============================"
    DISPLAY "        ORDER SUMMARY"
    DISPLAY "============================"
    DISPLAY "Orders: "
    DISPLAY WS-ORDER-LIST
    DISPLAY " "
    DISPLAY "Total Amount : PHP " WS-DISPLAY-TOTAL
    DISPLAY "Remaining    : PHP " WS-DISPLAY-FUNDS
    DISPLAY "============================"
    DISPLAY "Thank you for ordering!"
    DISPLAY " "

    STOP RUN.
