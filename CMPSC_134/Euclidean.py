
def gcd(a, b):
    
    if b > a:
        a, b = b, a
        #simply puts the larger of the two as a
        #although the block at the bottom switches them after the first iteration, this declutters the output
        
    if b == 0:
        if a == 0:
            print("0 = 0 * n + 0\n[In Euclidean, gcd(0,0) is undefined]") 
            #although widely accepted as both 0 and undefined, in euclidean there is no greatest integer "n" such that 0 * n = 0
            return "undefined"
        else:
            print(f"|{a}| = {abs(a)}\n[In cases with 0, absolute of the non-zero is the gcd]")
    
    while b != 0:
        print(f"{a} = {b} * {a//b} + {a%b}")
        a, b = b, a % b 
        #follows the progression of the euclidean algorithm where b is shifted as the new "A" and the previous remainder being the new "B"
        #this continues until b hits 0 and the previous remainder will be returned
    return abs(a)
    # the absolute value will be returned because the gcd can never be negative or 0
    # given the special case gcd(0,0) , both 0 and undefined are widely accepted, in this case i opted to have it just return undefined
    

def validateInput(prompt):
   
    while True:
        try:
            value = int(input(prompt))
            return value
        except ValueError:
            print("Invalid input: Please enter a valid integer.")



print("=== GCD Calculator ===")

# Get two valid integers
num1 = validateInput("Enter first number: ")
num2 = validateInput("Enter second number: ")
print("="*22)

# Calculate and display the GCD
result = gcd(num1, num2)
print(f"=> gcd({num1},{num2}) = {result}")
