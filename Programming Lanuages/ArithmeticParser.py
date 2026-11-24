class ArithmeticParser:
    def __init__(self, text):
        self.text = text.replace(" ", "")
        self.pos = 0

    def current_char(self):
        if self.pos < len(self.text):
            return self.text[self.pos]
        return None

    def parse_digit(self):
        ch = self.current_char()
        if ch is not None and ch.isdigit():
            self.pos += 1
            return True
        return False

    def parse_num(self):
        # <num> -> <digit> | <digit><num>
        if not self.parse_digit():
            return False

        while self.current_char() is not None and self.current_char().isdigit():
            self.pos += 1

        return True

    def parse_opr(self):
        # <opr> -> "+" | "-" | "*" | "/"
        ch = self.current_char()
        if ch in ['+', '-', '*', '/']:
            self.pos += 1
            return True
        return False

    def parse_expr(self):
        # <expr> -> <num> <opr> <num>
        if not self.parse_num():
            return False

        if not self.parse_opr():
            return False

        if not self.parse_num():
            return False

        return self.pos == len(self.text)


expression = input("Enter an arithmetic expression: ")

parser = ArithmeticParser(expression)

if parser.parse_expr():
    print("Valid expression according to the BNF grammar.")
else:
    print("Invalid expression.")
