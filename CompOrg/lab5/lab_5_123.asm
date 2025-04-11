# Given the following data definition statements, compute the addresses of arr2, arr3, str1, and str2, given that the address of arr1 is 0x10010000. Show your steps for a full mark. 
#Select “Show Labels Window (symbol table)” from the Settings menu in MARS to check the values of your computed addresses.  
.data 
arr1: .word 5:20 
arr2: .half 7, -2, 8, -6 
arr3: .space 100 
str1: .asciiz  "This is a message" 
str2: .asciiz  "Another important string"

#for arr2, we first compute arr1 and where it ends, since a word is 4 bytes, 0x10010000 + 20 x 4 = (80 converted to Hexa is 50) hence 0x10010050, this is where arr2 starts
#for arr3, we then compute where arr2 ends, since a half is 2 bytes, 0x10010050 + 4 x 2 = 0x10010058, this is where arr 3 starts
#for str1, we then compute where arr3 ends, since a space is 1 byte 0x10010058 + 100 x 1 = (88 + 100) = 0x100100bc [ the value in hexadecimal], this is where str1 starts
#for str2, we then compute where arr3 ends, having 17 characters + null character each taking up 1 byte, 0x100100bc + 18 x 1 = (188 + 18) = 0x100100ce [ the value in hexadecimal], this is where str2 starts

#2.arr1[5] = 0x10010000 + 5 x 4 = 0x10010014
#  arr1[17] = 0x10010000 + 17 x 4 = 0x10010044

#In problem 1, given that arr3 is a two-dimensional array of bytes with 20 rows and 5 columns, 
#what are the addresses of arr3[7][2], arr3[11][4], and arr3[19][3]?

#3. &matrix[i][j] = &matrix + (i×Cols + j) × element_size 
#   arr3[7][2] = 0x10010058 + (7x5 + 2) x 1 = (35 + 2 = 37 = 0x00000025) = 0x1001007d
#   arr[11][4] = 0x10010058 + (11x5 + 4) x 1 = (55 + 4 = 59 = 0x0000003b) = 0x10010093
#   arr[19][3] = 0x10010058 + (19x5 + 3) x 1 = (95 + 3 = 98 = 0x00000062) = 0x100100ba

