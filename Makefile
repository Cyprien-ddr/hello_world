
NAME = my_hello_world

SRC = $(wildcard src/*.c)

OBJ = $(SRC:.c=.o)

GCC = gcc

CFLAGS = -Wall -Iinclude -g3

TEST_SRC = $(wildcard tests/*.c)

TEST_OBJ = $(TEST_SRC:.c=.o)

%.o: %.c
	$(GCC) $(CFLAGS) -c $< -o $@

all : $(NAME)

$(NAME) : $(OBJ)
	gcc $(CFLAGS) -o $(NAME) main.c $(OBJ)

clean :
	rm -f $(OBJ)
	rm -f main.o

fclean : clean
	rm -f $(NAME)

re : fclean all

tests_run:
	gcc tests/*.c  $(SRC) -Iinclude -o unit_test --coverage -lcriterion
	./unit_test

tests_clean: fclean
	rm -f $(TEST_OBJ)
	rm -f unit_test*

.Phony : all re clean fclean tests_run tests_clean
