NAME := $(notdir $(CURDIR))

OC := ocamlopt

MODULES	:= people doctor main
SRCS := $(addsuffix .ml, $(MODULES))
OBJS := $(addsuffix .cmx, $(MODULES))

all: $(NAME)

$(NAME): $(OBJS)
	$(OC) -o $(NAME) $(OBJS)

%.cmx: %.ml
	$(OC) -c $<

run: all
	./$(NAME)

clean:
	rm -f *.cmx *.cmi *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all run clean fclean re
