clear
for file in src/*.asm; do
	if [ -f "$file" ]; then
		obj="${file%.asm}.o"
		nasm -o "$obj" -felf64 "$file"
	fi
done
ld -o table src/*.o
rm src/*.o
./table "$@"

