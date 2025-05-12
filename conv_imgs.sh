#!/bin/bash

# Check if required arguments are provided
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    echo "Usage: $0 input_extension output_extension [directory]"
    echo "Example: $0 jpg png /path/to/images"
    echo "If directory is not specified, the current directory will be used."
    exit 1
fi

# Get the file extensions from input
INPUT_EXT=$1
OUTPUT_EXT=$2

# Set the directory - use current directory if not specified
DIR="."
if [ $# -eq 3 ]; then
    DIR="$3"
    # Check if directory exists
    if [ ! -d "$DIR" ]; then
        echo "Error: Directory '$DIR' does not exist."
        exit 1
    fi
fi

# Check if any files with the specified extension exist in the directory
if [ ! "$(find "$DIR" -maxdepth 1 -name "*.$INPUT_EXT" 2>/dev/null)" ]; then
    echo "No files with .$INPUT_EXT extension found in '$DIR'."
    exit 1
fi

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Convert all files with the specified extension to the output format
for file in "$DIR"/*.$INPUT_EXT; do
    # Extract filename without extension
    filename="${file%.*}"
    
    echo "Converting $file to $filename.$OUTPUT_EXT"
    magick "$file" "$filename.$OUTPUT_EXT"
done

echo "Conversion complete!"
