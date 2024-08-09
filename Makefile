all:
	nasm -f bin ./src/boot.asm -o ./bin/boot.bin

clean:
	rm -rf ./bin/boot.bin

run: ./bin/boot.bin
	qemu-system-x86_64 -hda ./bin/boot.bin