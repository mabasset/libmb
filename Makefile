NAME = libmb.a
CFLAGS = -Wall -Wextra -Werror

LIST_DIR = list
BTREE_DIR = btree

LIST_SRCS = $(wildcard $(LIST_DIR)/*.c)

BTREE_SRCS = $(wildcard $(BTREE_DIR)/*.c)

ALL_SRCS = $(LIST_SRCS) $(BTREE_SRCS)

ALL_OBJS = $(ALL_SRCS:.c=.o)

LIST_HEADER = $(LIST_DIR)/ft_list.h
BTREE_HEADER = $(BTREE_DIR)/ft_btree.h

all: $(NAME) clean

$(NAME): $(ALL_OBJS)
	ar rcs $(NAME) $(ALL_OBJS)

$(LIST_DIR)/%.o: $(LIST_DIR)/%.c $(LIST_HEADER)
	gcc $(CFLAGS) -c $< -o $@

$(BTREE_DIR)/%.o: $(BTREE_DIR)/%.c $(BTREE_HEADER) $(LIST_HEADER)
	gcc $(CFLAGS) -I$(LIST_DIR) -c $< -o $@

clean:
	rm -f $(ALL_OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
