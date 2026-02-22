#!/bin/bash

# =========================================
# Secret Code Generator
# Author: yourname
# GitHub: https://github.com/yourusername
# =========================================

echo "=============================="
echo " 🔐 Secret Code Generator"
echo "=============================="

# Character sets
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
NUMBERS="0123456789"
SYMBOLS="@#$%&*!?"

ALL_CHARS="$LOWERCASE$UPPERCASE$NUMBERS$SYMBOLS"

# Ask user for length
read -p "Enter secret code length: " LENGTH

# Validation
if ! [[ "$LENGTH" =~ ^[0-9]+$ ]] || [ "$LENGTH" -le 0 ]; then
    echo "❌ Invalid length!"
    exit 1
fi

SECRET=""

for (( i=0; i<$LENGTH; i++ )); do
    RAND_INDEX=$(( RANDOM % ${#ALL_CHARS} ))
    SECRET="${SECRET}${ALL_CHARS:$RAND_INDEX:1}"
done

echo ""
echo "✅ Generated Secret Code:"
echo "--------------------------------"
echo "$SECRET"
echo "--------------------------------"

# Save to file option
read -p "Save to file? (y/n): " SAVE

if [[ "$SAVE" == "y" || "$SAVE" == "Y" ]]; then
    FILE="secret_codes.txt"
    echo "$SECRET" >> $FILE
    echo "📁 Saved to $FILE"
fi
