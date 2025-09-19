NAME = libmb.a
CFLAGS = -Wall -Wextra -Werror

LIST_DIR = list/
BTREE_DIR = btree/
PRINTF_DIR = printf/
LIBFT_DIR = libft/

LIST_SRCS = $(wildcard $(LIST_DIR)*.c)
BTREE_SRCS = $(wildcard $(BTREE_DIR)*.c)
LIBFT_SRCS = $(wildcard $(LIBFT_DIR)*.c)
PRINTF_SRCS = $(wildcard $(PRINTF_DIR)*.c)

ALL_SRCS = $(LIST_SRCS) $(BTREE_SRCS) $(LIBFT_SRCS) $(PRINTF_SRCS)
ALL_OBJS = $(ALL_SRCS:.c=.o)

LIST_HEADER = $(LIST_DIR)ft_list.h
BTREE_HEADER = $(BTREE_DIR)ft_btree.h
LIBFT_HEADER = $(LIBFT_DIR)libft.h
PRINT_HEADER = $(PRINT_DIR)ft_printf.h

all: $(NAME)

$(NAME): $(ALL_OBJS)
	ar rcs $(NAME) $(ALL_OBJS)

%.o: %.c $(BTREE_HEADER) $(LIST_HEADER) $(LIBFT_HEADER) $(PRINT_HEADER)
	gcc $(CFLAGS) -c $< -o $@

clean:
	rm -f $(ALL_OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

test:
	gcc $(CFLAGS) -o test test.c -L. -lmb

.PHONY: all clean fclean re test
