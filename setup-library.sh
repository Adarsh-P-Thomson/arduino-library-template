#!/bin/bash

# Arduino Library Setup Script
# This script helps you rename the template to your library name

echo "========================================="
echo "  Arduino Library Template Setup"
echo "========================================="
echo ""

# Get library name
read -p "Enter your library name (e.g., MyAwesomeLibrary): " LIBRARY_NAME

if [ -z "$LIBRARY_NAME" ]; then
    echo "Error: Library name cannot be empty"
    exit 1
fi

# Get author details
read -p "Enter your name: " AUTHOR_NAME
read -p "Enter your email: " AUTHOR_EMAIL
read -p "Enter short description: " SHORT_DESC
read -p "Enter GitHub username: " GITHUB_USER

echo ""
echo "========================================="
echo "  Configuration"
echo "========================================="
echo "Library Name: $LIBRARY_NAME"
echo "Author: $AUTHOR_NAME <$AUTHOR_EMAIL>"
echo "Description: $SHORT_DESC"
echo "GitHub: $GITHUB_USER"
echo ""
read -p "Is this correct? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "Setup cancelled"
    exit 0
fi

echo ""
echo "Setting up your library..."

# Rename files
mv src/LibraryName.h "src/${LIBRARY_NAME}.h"
mv src/LibraryName.cpp "src/${LIBRARY_NAME}.cpp"

# Update library.properties
sed -i "s/name=arduino-library-template/name=${LIBRARY_NAME}/" library.properties
sed -i "s/author=Adarsh P Thomson <adarshpthomson7@gmail.com>/author=${AUTHOR_NAME} <${AUTHOR_EMAIL}>/" library.properties
sed -i "s/maintainer=Adarsh P Thomson <adarshpthomson7@gmail.com>/maintainer=${AUTHOR_NAME} <${AUTHOR_EMAIL}>/" library.properties
sed -i "s/sentence=A template for creating Arduino libraries./sentence=${SHORT_DESC}/" library.properties
sed -i "s/url=https:\/\/github.com\/Adarsh-P-Thomson\/arduino-library-template/url=https:\/\/github.com\/${GITHUB_USER}\/${LIBRARY_NAME}/" library.properties
sed -i "s/includes=LibraryName.h/includes=${LIBRARY_NAME}.h/" library.properties

# Update keywords.txt
sed -i "s/LibraryName/${LIBRARY_NAME}/g" keywords.txt

# Update header files
UPPER_LIBRARY_NAME=$(echo "$LIBRARY_NAME" | tr '[:lower:]' '[:upper:]')
sed -i "s/LIBRARY_NAME_H/${UPPER_LIBRARY_NAME}_H/g" "src/${LIBRARY_NAME}.h"
sed -i "s/class LibraryName/class ${LIBRARY_NAME}/g" "src/${LIBRARY_NAME}.h"
sed -i "s/LibraryName(/${LIBRARY_NAME}(/g" "src/${LIBRARY_NAME}.h"

# Update cpp file
sed -i "s/LibraryName.h/${LIBRARY_NAME}.h/g" "src/${LIBRARY_NAME}.cpp"
sed -i "s/LibraryName::/${LIBRARY_NAME}::/g" "src/${LIBRARY_NAME}.cpp"

# Update internal utils
sed -i "s/LIBRARY_NAME_UTILS_H/${UPPER_LIBRARY_NAME}_UTILS_H/g" src/internal/utils.h
sed -i "s/LibraryNameInternal/${LIBRARY_NAME}Internal/g" src/internal/utils.h

# Update examples
sed -i "s/<LibraryName.h>/<${LIBRARY_NAME}.h>/g" examples/BasicUsage/BasicUsage.ino
sed -i "s/<LibraryName.h>/<${LIBRARY_NAME}.h>/g" examples/AdvancedUsage/AdvancedUsage.ino
sed -i "s/LibraryName /${LIBRARY_NAME} /g" examples/BasicUsage/BasicUsage.ino
sed -i "s/LibraryName /${LIBRARY_NAME} /g" examples/AdvancedUsage/AdvancedUsage.ino

# Update README
sed -i "s/Adarsh P Thomson/${AUTHOR_NAME}/g" README.md
sed -i "s/Adarsh-P-Thomson/${GITHUB_USER}/g" README.md
sed -i "s/arduino-library-template/${LIBRARY_NAME}/g" README.md

# Update LICENSE
sed -i "s/Adarsh P Thomson/${AUTHOR_NAME}/g" LICENSE

echo ""
echo "========================================="
echo "  Setup Complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Review and update README.md"
echo "2. Implement your library in src/${LIBRARY_NAME}.h and src/${LIBRARY_NAME}.cpp"
echo "3. Update example sketches"
echo "4. Test your library locally"
echo "5. Push to GitHub and create a release"
echo ""
echo "Happy coding! \ud83d\ude80"
