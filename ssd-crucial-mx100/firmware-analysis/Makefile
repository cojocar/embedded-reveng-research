TOOL_PREFIX=arm-linux-gnueabi
CFLAGS ?= -O0
LDFLAGS += -Ttext=0x0  -nostdlib -nostdinc

all: echo.bin while1.bin my-print.bin my-echo.bin

%.S.elf: %.S
	$(TOOL_PREFIX)-gcc -fPIC $(CFLAGS) $(LDFLAGS) -marm -march=armv7-a -o $@ $^

%.bin: %.S.elf
	$(TOOL_PREFIX)-objcopy -S -j.text -O binary $< $@

.PHONY: clean
.PRECIOUS: %.o %.S.elf
clean:
	rm -f *.o *.elf *.bin
