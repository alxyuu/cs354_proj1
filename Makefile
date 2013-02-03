###########################################################
# Project 1 Makefile

CC = gcc
CFLAGS = -Wall -ggdb
INCLUDE = -I/lusr/X11/include -I/lusr/include
LIBDIR = -L/lusr/X11/lib -L/lusr/lib
# Libraries that use native graphics hardware --
# appropriate for Linux machines in Painter and ENS basement
LIBS = -lglut -lGLU -lGL -lpthread -lm

###########################################################
# Options if compiling on Mac
UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
CC = g++
CFLAGS = -Wall -g -D__MAC__
INCLUDE = 
LIBDIR = -L/lusr/X11/lib
LIBS = -framework OpenGL -framework GLUT
endif

###########################################################
# Uncomment the following line if you are using Mesa
#LIBS = -lglut -lMesaGLU -lMesaGL -lm

canvas: canvas.c drawing.c drawing.h vrml.c vrml.h mouse.c mouse.h
	${CC} ${CFLAGS} $(INCLUDE) -o canvas ${LIBDIR} canvas.c drawing.c vrml.c mouse.c ${LIBS}

clean:
	rm -f canvas *.o core
