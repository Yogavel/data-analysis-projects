my_string = "LaunchCode"


# a) Use string methods to remove the first three characters from the string and 
# add them to the end.

n = 3

modified_string = my_string[n:] + my_string[:n]


# Use a template literal to print the original and modified string in a 
# descriptive phrase.

n = 3
modified_string = my_string[n:] + my_string[:n]

print("Original string:", my_string)
print("Modified string:", modified_string)

# b) Modify your code to accept user input. Query the user to enter the 
# number of letters that will be relocated.

n = int(input("Enter the number of letters to be relocated:"))
modified_string = my_string[n:] + my_string[:n]
print(f"Original string: {my_string}")
print(f"Modified string: {modified_string}")


# c) Add validation to your code to deal with user inputs that are longer than the word.
#  In such cases, default to moving 3 characters. Also, the template literal should 
# note the error.

   
n = int(input("Enter the number of letters to be relocated:"))
if n < len(my_string)-1:
    modified_string=my_string[n:] + my_string[:n]
    print(f"The Original string is {my_string} and the Modified string is {modified_string}")
else:
    modified_string=my_string[3:] + my_string[:3]
    print(f"The Original string is {my_string} and the Modified string is {modified_string}")
