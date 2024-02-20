##
## WOLFRAM PROJECT, 2024
## [Conteneur de développement : C @ desktop-linux]
## File description:
## Makefile
##

CC = stack build
BINARY_PATH	= $(shell stack path --local-install-root)
NAME = wolfram

all:
	$(CC)
	cp $(BINARY_PATH)/bin/$(NAME) ./$(NAME)

clean:
	stack clean

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
