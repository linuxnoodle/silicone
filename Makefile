PROJECT:=silicone

CC:=g++
LDFLAGS=-O2 -Wall -Iinclude -std=c++20 $(shell pkg-config --libs gtk4)
CFLAGS=$(shell pkg-config --cflags gtk4)
UNAME:=$(shell uname)

SRCDIR:=src
OBJDIR:=obj

SRC:=$(wildcard $(SRCDIR)/*.cpp)
OBJ:=$(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)

$(PROJECT): $(OBJ)
	$(CC) $(OBJ) $(CFLAGS) $(LDFLAGS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir $(OBJDIR)

.PHONY: all
all: clean $(PROJECT)

.PHONY: clean
clean:
	rm -rf $(OBJDIR) $(PROJECT) words.txt
