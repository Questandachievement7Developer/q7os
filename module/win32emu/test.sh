qemu-system-x86_64 \
    -name fakex86 \
    -hda ./runtime.x86 \
    -kernel ./vmlinuz \
    -initrd ./initrd.lz \
    -append 'console=ttyS0 debug root=/dev/sda init=/init' \
    -m 1024m \
    -smp 4 \
    -serial mon:stdio \
    -nographic