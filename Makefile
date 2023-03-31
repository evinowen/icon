TARGET=none
CONFIG=./nes.cfg
OBJECTFILE=./bin/icon.o
OUTFILE=./bin/icon.nes
DBGFILE=./bin/icon.dbg
MAPFILE=./bin/icon.map
LABELFILE=./bin/icon.lbl
LINKERFILE=./bin/icon.lnk
SOURCE=src/main.asm

.PHONY: build clean run env-emulator-path

build:
	./util/gen.includes.sh
	mkdir -p ./bin
	ca65 -g -l ${LINKERFILE} -t ${TARGET} ${SOURCE} -o ${OBJECTFILE}
	ld65 -Ln ${LABELFILE} -m ${MAPFILE} -vm --dbgfile ${DBGFILE} -o ${OUTFILE} -C ${CONFIG} ${OBJECTFILE} ${TARGET}.lib
	./util/gen.fceux.nl.sh ${DBGFILE} ${OUTFILE}

clean:
	rm -rf ./bin

run: env-emulator-path
	${EMULATOR_PATH} ${OUTFILE} &

env-emulator-path:
ifndef EMULATOR_PATH
	$(error EMULATOR_PATH is not set)
endif
