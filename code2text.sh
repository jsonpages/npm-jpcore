#!/bin/bash

# Nome dello script finale che verrà generato
OUTPUT="install_skeletonV3.3-greenbuild.sh"
# Delimitatore per l'HEREDOC (deve essere una stringa che non appare nel tuo codice)
DELIMITER="END_OF_FILE_CONTENT"

echo "Generazione dello script $OUTPUT in corso..."

# 1. Crea l'intestazione dello script finale
cat > "$OUTPUT" << HEADER
#!/bin/bash
set -e # Termina se c'è un errore

echo "Inizio ricostruzione progetto..."

HEADER

# 2. Trova tutti i file e cartelle nella directory corrente (escludendo lo script stesso e file nascosti come .git)
# Nota: Modifica il comando find se vuoi includere file nascosti togliendo "-not -path '*/.*'"
find . -not -path '*/.*' -not -name "$OUTPUT" -not -name "$(basename "$0")" | sort | while read -r FILE; do
    
    # Rimuovi il "./" iniziale dal percorso
    CLEAN_PATH="${FILE#./}"

    if [ -d "$FILE" ]; then
        # SE È UNA CARTELLA: Scrivi il comando mkdir
        echo "mkdir -p \"$CLEAN_PATH\"" >> "$OUTPUT"
    
    elif [ -f "$FILE" ]; then
        # SE È UN FILE:
        # Controllo se è un file binario (immagini, eseguibili) perché 'cat' li corromperebbe
        if grep -qI . "$FILE"; then
            # È un file di testo
            echo "echo \"Creating $CLEAN_PATH...\"" >> "$OUTPUT"
            
            # Scrive l'intestazione del cat
            echo "cat << '$DELIMITER' > \"$CLEAN_PATH\"" >> "$OUTPUT"
            
            # Copia il contenuto del file
            cat "$FILE" >> "$OUTPUT"
            
            # Assicura che ci sia un ritorno a capo prima del delimitatore
            echo "" >> "$OUTPUT"
            
            # Chiude il blocco dati
            echo "$DELIMITER" >> "$OUTPUT"

            # Se il file originale era eseguibile, ripristina i permessi
            if [ -x "$FILE" ]; then
                echo "chmod +x \"$CLEAN_PATH\"" >> "$OUTPUT"
            fi
        else
            echo "# SKIP: $CLEAN_PATH è un file binario e non può essere convertito in testo." >> "$OUTPUT"
            echo "Attenzione: $CLEAN_PATH ignorato (binario)."
        fi
    fi
done

# 3. Rende lo script generato eseguibile
chmod +x "$OUTPUT"

echo "Fatto! Esegui ./$OUTPUT per ricreare la struttura."