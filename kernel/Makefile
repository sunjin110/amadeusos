TARGET = kernel.elf
OBJS = main.o

CXXFLAGS += -O2 -Wall -g --target=x86_64-elf -ffreestanding -mno-red-zone \
			-fno-exceptions -fno-rtti -std=c++17

LDFALGS += --entry KernelMain -z norelro --image-base 0x100000 --static

# 必須項目にMakefileが指定されている理由としては
# Makefileが更新されたときにも、buildし直すべきなので、そのように指定されている

.PHONE: all
all: $(TARGET)

.PHONE: clean
clean:
	rm -rf *.o

kernel.elf: $(OBJS) Makefile
	ld.lld $(LDFALGS) -o kernel.elf $(OBJS)

%.o: %.cpp Makefile
	clang++ $(CPPFLAGS) $(CXXFLAGS) -c $<
