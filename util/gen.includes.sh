echo ";; Constants Index - Generated $(date)" > ./src/.constants.asm
find ./src/constants -type f | sed 's/\.\/src\/\(.*\)\.asm$/\.include \"\1.asm\"/' >> ./src/.constants.asm

echo ";; Macro Index - Generated $(date)" > ./src/.macros.asm
find ./src/macros -type f | sed 's/\.\/src\/\(.*\)\.asm$/\.include \"\1.asm\"/' >> ./src/.macros.asm
