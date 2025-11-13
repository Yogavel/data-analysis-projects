proto_list1 = "3,6,9,12"
proto_list2 = "A;C;M;E"
proto_list3 = "space delimited string"
proto_list4 = "Comma-spaces, might, require, typing, caution"

strings = [proto_list1, proto_list2, proto_list3, proto_list4]

# a) Use the 'in' method to check to see if the words in each string are separated 
# by commas (,), semicolons (;) or just spaces.

proto_list1 = "3,6,9,12"
proto_list2 = "A;C;M;E"
proto_list3 = "space delimited string"
proto_list4 = "Comma-spaces, might, require, typing, caution"

strings = [proto_list1, proto_list2, proto_list3, proto_list4]

for s in strings:
  
    if "," in s:
        print("separated by commas.")
    elif ";" in s: 
        print("separated by semicolons.")
    elif " " in s:
        print("separated by spaces.")
    else:
        print("No spaces.")



# b) If the string uses commas to separate the words, split it into an array, 
# reverse the entries, and then join the array into a new comma separated string.

for s in strings:
    if "," in s:
     new_string = s.split(",")
     new_string.reverse()
     new_string2 = ",".join(new_string)
print(f"Original: {s}")
print(f"Reversed: {new_string2}")

# c) If the string uses semicolons to separate the words, split it into an array, 
# alphabetize the entries, and then join the array into a new comma separated string.

for s in strings:
    if ";" in s:
        new_string = s.split(";")
        new_string.sort()
        new_string2 = ",".join(new_string)
        print(f"Original: {s}")
        print(f"Alphabetized: {new_string2}")


# d) If the string uses spaces to separate the words, split it into an array, 
# reverse alphabetize the entries, and then join the array into a 
# new space separated string.

for s in strings:
    if " " in s and "," not in s and ";" not in s:
        new_string = s.split(" ")
        new_string.sort(reverse=True)
        new_string2 = " ".join(new_string2)
        print(f"Original: {s}")
        print(f"Reverse-alphabetized: {new_string}")

# e) If the string uses ‘comma spaces’ to separate the list, 
# modify your code to produce the same result as part “b”, 
# making sure that the extra spaces are NOT part of the final string.

for s in strings:
    if ", " in s:
        new_string = s.split(", ")
        new_string.reverse()
        new_string2 = ",".join(new_string)
        print(f"Original: {s}")
        print(f"Reversed (no spaces): {new_string}")

