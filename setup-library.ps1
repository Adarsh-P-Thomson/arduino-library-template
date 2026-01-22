# Arduino Library Setup Script for Windows
# This script helps you rename the template to your library name

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Arduino Library Template Setup" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Get library name
$LIBRARY_NAME = Read-Host "Enter your library name (e.g., MyAwesomeLibrary)"

if ([string]::IsNullOrEmpty($LIBRARY_NAME)) {
    Write-Host "Error: Library name cannot be empty" -ForegroundColor Red
    exit 1
}

# Get author details
$AUTHOR_NAME = Read-Host "Enter your name"
$AUTHOR_EMAIL = Read-Host "Enter your email"
$SHORT_DESC = Read-Host "Enter short description"
$GITHUB_USER = Read-Host "Enter GitHub username"

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Configuration" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "Library Name: $LIBRARY_NAME" -ForegroundColor Green
Write-Host "Author: $AUTHOR_NAME <$AUTHOR_EMAIL>" -ForegroundColor Green
Write-Host "Description: $SHORT_DESC" -ForegroundColor Green
Write-Host "GitHub: $GITHUB_USER" -ForegroundColor Green
Write-Host ""
$CONFIRM = Read-Host "Is this correct? (y/n)"

if ($CONFIRM -ne "y") {
    Write-Host "Setup cancelled" -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "Setting up your library..." -ForegroundColor Yellow

# Rename files
Rename-Item -Path "src/LibraryName.h" -NewName "$LIBRARY_NAME.h"
Rename-Item -Path "src/LibraryName.cpp" -NewName "$LIBRARY_NAME.cpp"

# Update library.properties
$content = Get-Content -Path "library.properties" -Raw
$content = $content -replace "name=arduino-library-template", "name=$LIBRARY_NAME"
$content = $content -replace "author=Adarsh P Thomson <adarshpthomson7@gmail.com>", "author=$AUTHOR_NAME <$AUTHOR_EMAIL>"
$content = $content -replace "maintainer=Adarsh P Thomson <adarshpthomson7@gmail.com>", "maintainer=$AUTHOR_NAME <$AUTHOR_EMAIL>"
$content = $content -replace "sentence=A template for creating Arduino libraries.", "sentence=$SHORT_DESC"
$content = $content -replace "url=https://github.com/Adarsh-P-Thomson/arduino-library-template", "url=https://github.com/$GITHUB_USER/$LIBRARY_NAME"
$content = $content -replace "includes=LibraryName.h", "includes=$LIBRARY_NAME.h"
Set-Content -Path "library.properties" -Value $content

# Update keywords.txt
$content = Get-Content -Path "keywords.txt" -Raw
$content = $content -replace "LibraryName", $LIBRARY_NAME
Set-Content -Path "keywords.txt" -Value $content

# Update header file
$UPPER_LIBRARY_NAME = $LIBRARY_NAME.ToUpper()
$content = Get-Content -Path "src/$LIBRARY_NAME.h" -Raw
$content = $content -replace "LIBRARY_NAME_H", "${UPPER_LIBRARY_NAME}_H"
$content = $content -replace "class LibraryName", "class $LIBRARY_NAME"
$content = $content -replace "LibraryName\(", "$LIBRARY_NAME("
Set-Content -Path "src/$LIBRARY_NAME.h" -Value $content

# Update cpp file
$content = Get-Content -Path "src/$LIBRARY_NAME.cpp" -Raw
$content = $content -replace "LibraryName\.h", "$LIBRARY_NAME.h"
$content = $content -replace "LibraryName::", "${LIBRARY_NAME}::"
Set-Content -Path "src/$LIBRARY_NAME.cpp" -Value $content

# Update internal utils
$content = Get-Content -Path "src/internal/utils.h" -Raw
$content = $content -replace "LIBRARY_NAME_UTILS_H", "${UPPER_LIBRARY_NAME}_UTILS_H"
$content = $content -replace "LibraryNameInternal", "${LIBRARY_NAME}Internal"
Set-Content -Path "src/internal/utils.h" -Value $content

# Update examples
$content = Get-Content -Path "examples/BasicUsage/BasicUsage.ino" -Raw
$content = $content -replace "<LibraryName\.h>", "<$LIBRARY_NAME.h>"
$content = $content -replace "LibraryName ", "$LIBRARY_NAME "
Set-Content -Path "examples/BasicUsage/BasicUsage.ino" -Value $content

$content = Get-Content -Path "examples/AdvancedUsage/AdvancedUsage.ino" -Raw
$content = $content -replace "<LibraryName\.h>", "<$LIBRARY_NAME.h>"
$content = $content -replace "LibraryName ", "$LIBRARY_NAME "
Set-Content -Path "examples/AdvancedUsage/AdvancedUsage.ino" -Value $content

# Update README
$content = Get-Content -Path "README.md" -Raw
$content = $content -replace "Adarsh P Thomson", $AUTHOR_NAME
$content = $content -replace "Adarsh-P-Thomson", $GITHUB_USER
$content = $content -replace "arduino-library-template", $LIBRARY_NAME
Set-Content -Path "README.md" -Value $content

# Update LICENSE
$currentYear = (Get-Date).Year
$content = Get-Content -Path "LICENSE" -Raw
$content = $content -replace "2025 Adarsh P Thomson", "$currentYear $AUTHOR_NAME"
Set-Content -Path "LICENSE" -Value $content

Write-Host ""
Write-Host "=========================================" -ForegroundColor Green
Write-Host "  Setup Complete!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Review and update README.md"
Write-Host "2. Implement your library in src/$LIBRARY_NAME.h and src/$LIBRARY_NAME.cpp"
Write-Host "3. Update example sketches"
Write-Host "4. Test your library locally"
Write-Host "5. Push to GitHub and create a release"
Write-Host ""
Write-Host "Happy coding! 🚀" -ForegroundColor Green
