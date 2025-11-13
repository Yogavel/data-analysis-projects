
for str in strings:
    if ',' in str and ', ' not in str:
        
        items = str.split(',')
        items.reverse()
        new_str = ','.join(items)
        print(f"Original: {str} -> Comma-separated reversed: {new_str}")

    elif ';' in str:
        # Semicolon-separated
        items = s.split(';')
        items.sort()
        new_s = ','.join(items)
        print(f"Original: {s} -> Semicolon-separated alphabetized: {new_s}")

    elif ' ' in s and ',' not in s:
        # Space-separated
        items = s.split()
        items.sort(reverse=True)
        new_s = ' '.join(items)
        print(f"Original: {s} -> Space-separated reverse alphabetized: {new_s}")

    elif ', ' in s:
        # Comma-spaces, remove extra spaces and reverse
        items = [item.strip() for item in s.split(',')]
        items.reverse()
        new_s = ','.join(items)
        print(f"Original: {s} -> Comma-spaces reversed: {new_s}")

    else:
        # Unknown separator
        print(f"Original: {s} -> Unknown format")