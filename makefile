FLAGS= -g -DDEBUG
LIBS= -lm
ALWAYS_REBUILD=makefile

#nbody: nbody.o compute.o
#	gcc $(FLAGS) $^ -o $@ $(LIBS)
#nbody.o: nbody.c planets.h config.h vector.h $(ALWAYS_REBUILD)
#	gcc $(FLAGS) -c $<
#compute.o: compute.c config.h vector.h $(ALWAYS_REBUILD)
#	gcc $(FLAGS) -c $<
cuda_nbody: cuda_nbody.o cuda_compute.o
	nvcc $(FLAGS) $^ -o $@ $(LIBS)
cuda_nbody.o: cuda_nbody.cu planets.h config.h vector.h $(ALWAYS_REBUILD)
	nvcc $(FLAGS) -c $<
cuda_compute.o: cuda_compute.cu config.h vector.h $(ALWAYS_REBUILD)
	nvcc $(FLAGS) -c $<
clean:
	rm -f *.o *nbody
