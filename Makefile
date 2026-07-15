ROM = sample
OBJS = main.o sample.o

all: $(ROM).gb

$(ROM).gb: $(OBJS)
	rgblink -o $(ROM).gb -n $(ROM).sym -m $(ROM).map $(OBJS)
	rgbfix -v -p 0 $(ROM).gb

main.o: main.rgbasm
	rgbasm -o main.o main.rgbasm

sample.o: sample.rgbasm
	rgbasm -o sample.o sample.rgbasm

clean:
	rm -f *.o *.gb