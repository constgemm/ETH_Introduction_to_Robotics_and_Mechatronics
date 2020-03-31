all:  serialLib serialTest 
	

serialLib:
	gcc -c  digital_filter.c 


serialTest: serialLib
	gcc -o lab03_2  digital_filter.o  lab03_2.c -lm
	
clean:
	rm -rf digital_filter.o lab03_2.o  lab03_2
