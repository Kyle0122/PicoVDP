# The first 32 colors in the palette as hex codes
color_palette_hex = [
    "#000000", "#7e2553", "#c3002e", "#ff004d", "#ff6600", "#ffa300", "#ffec27", "#ffff7d",
    "#a7f735", "#00e436", "#00b251", "#008751", "#125359", "#1d2b53", "#0a62be", "#29adff",
    "#83ebf5", "#fff1e8", "#ffccaa", "#d48e6f", "#ab5236", "#742f29", "#422136", "#5f347e",
    "#db37b8", "#ff77a8", "#ffacc5", "#bd9adf", "#83769c", "#5f574f", "#a28879", "#c2c3c7"
]

# Convert hex color codes to RGB tuples
def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

# Initialize the palette with RGB values, and fill the remaining with zeros
color_palette = [hex_to_rgb(color) for color in color_palette_hex]
color_palette += [(0, 0, 0)] * (64 - len(color_palette))

# Ensure the palette has exactly 64 colors
if len(color_palette) != 64:
    raise ValueError("Color palette must contain exactly 64 colors.")

# Initialize lookup tables
red_table = []
green_table = []
blue_table = []

# Populate the lookup tables
for color in color_palette:
    r, g, b = color
    red_table.append(r)
    green_table.append(g)
    blue_table.append(b)

# Write the lookup tables to raw hex files
with open("Table_R.hex", "w") as red_file:
    red_file.write("v2.0 raw\n")
    for value in red_table:
        red_file.write(format(value, 'x').zfill(2) + "\n")

with open("Table_G.hex", "w") as green_file:
    green_file.write("v2.0 raw\n")
    for value in green_table:
        green_file.write(format(value, 'x').zfill(2) + "\n")

with open("Table_B.hex", "w") as blue_file:
    blue_file.write("v2.0 raw\n")
    for value in blue_table:
        blue_file.write(format(value, 'x').zfill(2) + "\n")

print("Hex files generated: Table_R.hex, Table_G.hex, Table_B.hex")
