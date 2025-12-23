#!/bin/bash

# 1. Prüfen, ob ein Name übergeben wurde
if [ -z "$1" ]; then
    echo "Bitte gib einen Projektnamen an!"
    echo "Benutzung: create_c_project <projektname>"
    exit 1
fi

PROJECT_NAME=$1

# 2. Hauptordner erstellen
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

echo "🚀 Erstelle Projekt: $PROJECT_NAME..."

# 3. Standard-Ordnerstruktur anlegen
mkdir src include build

# 4. Standard-Dateien erstellen
touch src/main.c
touch README.md

# 5. main.c mit Standard-Code füllen
cat <<EOF > src/main.c
#include <stdio.h>

int main() {
    printf("Hello, $PROJECT_NAME!\\n");
    return 0;
}
EOF

# 6. CMakeLists.txt generieren (Der wichtige Teil!)
# Wir nutzen 'cat <<EOF', um den Textblock in die Datei zu schreiben.
cat <<EOF > CMakeLists.txt
cmake_minimum_required(VERSION 3.10)

project($PROJECT_NAME)

# Header-Dateien im 'include' Ordner finden
include_directories(include)

# Alle .c Dateien aus src/ automatisch finden (optional, aber bequem für den Start)
file(GLOB SOURCES "src/*.c")

# Executable erstellen
add_executable($PROJECT_NAME \${SOURCES})

# Include-Pfad setzen
target_include_directories($PROJECT_NAME PRIVATE include)
EOF

# 7. Git initialisieren (Optional, aber empfohlen)
git init > /dev/null
cat <<EOF > .gitignore
build/
.vscode/
.DS_Store
EOF

echo "✅ Fertig! Projekt '$PROJECT_NAME' wurde erstellt."
echo "👉 cd $PROJECT_NAME"
