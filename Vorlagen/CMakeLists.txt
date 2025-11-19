cmake_minimum_required(VERSION 3.10)

project(Kontaktliste)

# 1. Alle .c Dateien sammeln (jetzt mit Pfad!)
add_executable(
    App
    main.c
    src/kontaktliste.c
    src/kontakt_io.c
    src/menu.c
)

# 2. Dem Compiler sagen, wo die Header liegen
# PRIVATE bedeutet: Nur dieses Target braucht den Include-Pfad
target_include_directories(App PRIVATE include)

# Setzt den Output-Namen auf "KontaktManager"
set_target_properties(App PROPERTIES OUTPUT_NAME "KontaktManager")
