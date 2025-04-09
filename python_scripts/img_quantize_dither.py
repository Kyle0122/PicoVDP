from PIL import Image
import sys
import numpy as np
from numba import jit, int8, float32

# Load the image
def load_image(image_path):
    try:
        image = Image.open(image_path)
        return image
    except Exception as e:
        print("Error loading image:", e)
        sys.exit(1)

# Load the color palette from file
def load_color_palette(file_path):
    try:
        with open(file_path, 'r') as file:
            color_palette = []
            for line in file:
                line = line.strip()  # Remove any surrounding whitespace, including newline characters
                color = tuple(int(line[i:i+2], 16) for i in range(0, len(line), 2))
                color_palette.append(color)

            print("Loaded color palette:")
            for i, color in enumerate(color_palette):
                # Print four colors in a line
                if i % 4 == 0:
                    print(f"\nColor {i+1}:", end=' ')  # Start a new line
                print(f" {color},", end=' ')  # Use tab to separate colors

        return color_palette
    except Exception as e:
        print("Error loading color palette:", e)
        sys.exit(1)

# Find the closest palette color to the given pixel color and return quantization error
@jit(nopython=True)
def find_closest_palette_color(pixel, palette):
    r, g, b = pixel
    min_dist = 1e9  # Initialize with a very large number
    closest_color = (0, 0, 0)
    for color in palette:
        dist = (color[0] - r)**2 + (color[1] - g)**2 + (color[2] - b)**2
        if dist < min_dist:
            min_dist = dist
            closest_color = color
    quant_error = pixel - np.array(closest_color, dtype=np.float32)
    return closest_color, quant_error

# JIT compiled function to apply dithering
@jit(nopython=True)
def apply_dithering(pixels, palette, width, height):
    for y in range(height):
        for x in range(width):
            quant_color, quant_error = find_closest_palette_color(pixels[y, x], palette)
            pixels[y, x] = quant_color
            
            if x + 1 < width:
                pixels[y, x + 1] += quant_error * 7 / 16
            if y + 1 < height:
                if x > 0:
                    pixels[y + 1, x - 1] += quant_error * 3 / 16
                pixels[y + 1, x] += quant_error * 5 / 16
                if x + 1 < width:
                    pixels[y + 1, x + 1] += quant_error * 1 / 16
                    
# Apply Floyd-Steinberg dithering to the image
def floyd_steinberg_dithering(image, palette):
    pixels = np.array(image, dtype=np.float32)  # Use float32 to handle the error diffusion
    height, width = pixels.shape[:2]
    apply_dithering(pixels, palette, width, height)

    # Clip values to be in the valid range [0, 255] and convert back to uint8
    dithered_image = np.clip(pixels, 0, 255).astype(np.uint8)
    return Image.fromarray(dithered_image)

# Convert the image using the custom palette
def image_to_hex(image, color_palette):
    hex_data = ""
    for y in range(image.height):
        for x in range(image.width):
            try:
                pixel_color = image.getpixel((x, y))
                color_index = color_palette.index(pixel_color)
            except IndexError as e:
                color_index = 0
            hex_data += format(color_index, 'x').zfill(2) + "\n"
    return hex_data

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python img2rom.py input_image.png")
        sys.exit(1)

    input_image_path = sys.argv[1]

    # Load the color palette from file
    color_palette = load_color_palette("colors.hex")
    print("load palette size: %d" % len(color_palette))

    image = load_image(input_image_path)
    # Resize the image
    # image = image.resize((640, 480))
    image = image.resize((480, 272))
    dithered_img = floyd_steinberg_dithering(image, color_palette)
    dithered_img.save('palette_image.png')

    hex_data = image_to_hex(dithered_img, color_palette)

    base_file_name = input_image_path.split('.')[0]
    hex_output_file_name = base_file_name + "_rom.hex"

    # Write the hex data to a file
    with open(hex_output_file_name, "w") as hex_file:
        hex_file.write("v2.0 raw\n")
        hex_file.write(hex_data)

    print(f"Hex file generated: {hex_output_file_name}")
