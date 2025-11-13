food = "water bottles,meal packs,snacks,chocolate"
equipment = "space suits,jet packs,tool belts,thermal detonators"
pets = "parrots,cats,moose,alien eggs"
sleep_aids = "blankets,pillows,eyepatches,alarm clocks"

# a) Use split to convert the strings into four cabinet lists. 
# Alphabetize the contents of each cabinet.

food_list = sorted(food.split(","))
equipment_list = sorted(equipment.split(","))
pets_list = sorted(pets.split(","))
sleep_aids_list = sorted(sleep_aids.split(","))

print("a) Alphabetized cabinet lists:")
print("Food:", food_list)
print("Equipment:", equipment_list)
print("Pets:", pets_list)
print("Sleep Aids:", sleep_aids_list)
print()

# b) Initialize a cargo_hold list and add the cabinet lists to it. 
# Print cargo_hold to verify its structure.

cargo_hold = [food_list, equipment_list, pets_list, sleep_aids_list]

print("b) Cargo hold structure:")
print(cargo_hold)
print()

# c) Query the user to select a cabinet (0 - 3) in the cargo_hold.

cabinet_input = input("c) Select a cabinet (0 - 3): ")



# d) Use bracket notation and format to display the contents of the selected cabinet. 
# If the user entered an invalid number, print an error message.

if not cabinet_input.isnumeric():
    print("Enter a valid number 0 - 3")
else:
    cabinet_number = int(cabinet_input)
    if 0 <= cabinet_number <= 3:
        print(f"Cabinet details are {cargo_hold[cabinet_number]}")
    else:
        print("Enter a valid number 0 - 3")



# e) Modify the code to query the user for BOTH a cabinet in cargo_hold AND 
# a particular item. Use the in method to check if the cabinet contains the 
# selected item, then print “Cabinet ____ DOES/DOES NOT contain ____.”

cabinet_input = input("Select a cabinet (0 - 3): ")
if not cabinet_input.isnumeric():
    print("Enter a valid number 0 - 3")
else:
    cabinet_number = int(cabinet_input)

    if 0 <= cabinet_number <= 3:
        print(f"Cabinet {cabinet_number} contains: {cargo_hold[cabinet_number]}")

        contents = input("Enter an item to search for: ").strip().lower()
        cabinet_items = [thing.lower() for thing in cargo_hold[cabinet_number]]
        if contents in cabinet_items:
            print(f"Cabinet {cabinet_number} DOES contain {contents}.")
        else:
            print(f"Cabinet {cabinet_number} DOES NOT contain {contents}.")
    else:
        print("Enter a valid number 0 - 3")

