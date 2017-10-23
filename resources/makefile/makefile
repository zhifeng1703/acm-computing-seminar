objects = print.o

myprint.out : main.cpp $(objects)
	g++ -o myprint.out main.cpp $(objects)

$(objects):print.h
	g++ -c print.cpp print.h

clean:
	rm myprint.out $(objects)


