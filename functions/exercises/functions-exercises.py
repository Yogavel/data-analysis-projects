# Part 1 A -- Make a Line

def make_line(size):
    return "#" * size
print(make_line(5))

# Part 1 B -- Make a Square
# create a function using your make_line function to code a square

def make_line(size):
    line = ""
    for i in range(size):
        line += "#"
    return line
print(make_line(5))

# Part 1 C -- Make a Rectangle

def make_rectangle(width, height):
    rectangle = ""
    for i in range(height):
        rectangle += make_line(width)
        if i < height - 1:
            rectangle += "\n"
    return rectangle

def make_square(size):
    return make_rectangle(size, size)
print(make_rectangle(5, 3))

# Part 2 A -- Make a Stairs

def make_downward_stairs(height):
    stairs = ""
    for i in range(height):
        stairs += make_line(i + 1)
        if i < height - 1:
            stairs += "\n"
    return stairs
print(make_downward_stairs(5))

# Part 2 B -- Make Space-Line 

def make_space_line(numSpaces, numChars):
    return (" " * numSpaces) + ("#" * numChars) + (" " * numSpaces)
print(make_space_line(3, 5))

# Part 2 C -- Make Isosceles Triangle

def make_isosceles_triangle(height):
    triangle = ""
    for i in range(height):
        spaces = height - i - 1
        chars = 2 * i + 1
        triangle += make_space_line(spaces, chars)
        if i < height - 1:
            triangle += "\n"
    return triangle
print(make_isosceles_triangle(5))

# Part 3 -- Make a Diamond

def make_diamond(height):
    diamond = ""

    for i in range(height):
        spaces = height - i - 1
        chars = 2 * i + 1
        diamond += make_space_line(spaces, chars)
        diamond += "\n"

    for i in range(height - 2, -1, -1):
        spaces = height - i - 1
        chars = 2 * i + 1
        diamond += make_space_line(spaces, chars)
        if i != 0:
            diamond += "\n"

    return diamond
print(make_diamond(5))


