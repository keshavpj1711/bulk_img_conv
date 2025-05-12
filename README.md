# bulk_img_conv

A bash script to convert image files between formats using ImageMagick.

## Overview

This script allows you to easily convert all image files of a specific format in a directory to another format of your choice. It uses ImageMagick's `magick` command to perform high-quality conversions while preserving image quality.

## Requirements

- Bash shell
- [ImageMagick](https://imagemagick.org/index.php) installed on your system


## Installation

1. Clone this repository:

```bash
git clone https://github.com/yourusername/image-converter.git
cd image-converter
```

2. Make the script executable:

```bash
chmod +x convert_image.sh
```

3. Optionally, move it to a directory in your PATH for system-wide access:

```bash
sudo mv convert_image.sh /usr/local/bin/convert_image
```


## Usage

```bash
./convert_image.sh input_extension output_extension [directory]
```


### Parameters:

- `input_extension`: The file extension of images you want to convert (without the dot)
- `output_extension`: The desired output format (without the dot)
- `directory`: (Optional) The directory containing the images. If not specified, the current directory is used.


### Examples:

```bash
# Convert all JPG files to PNG in the current directory
./convert_image.sh jpg png

# Convert all WEBP files to JPG in a specific directory
./convert_image.sh webp jpg /home/user/Pictures

# Convert all TIFF files to WEBP in a specific directory
./convert_image.sh tiff webp /path/to/scans
```


## Supported Formats

This script supports all image formats that ImageMagick can handle, including but not limited to:

- PNG
- JPG/JPEG
- WEBP
- TIFF
- GIF
- BMP
- SVG
- HEIC
- PDF


## How It Works

The script:

1. Checks if the specified file extensions and directory are valid
2. Verifies that ImageMagick is installed
3. Finds all files with the specified input extension in the target directory
4. Converts each file to the desired output format, keeping the original filename (with new extension)
5. Preserves the original files

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
