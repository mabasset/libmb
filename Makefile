NAME = libmb.a
CFLAGS = -Wall -Wextra -Werror
RM = rm -f

LIST_DIR = list
BTREE_DIR = btree

LIST_SRCS = $(LIST_DIR)/ft_create_elem.c \
            $(LIST_DIR)/ft_list_at.c \
            $(LIST_DIR)/ft_list_clear.c \
            $(LIST_DIR)/ft_list_find.c \
            $(LIST_DIR)/ft_list_foreach.c \
            $(LIST_DIR)/ft_list_foreach_if.c \
            $(LIST_DIR)/ft_list_last.c \
            $(LIST_DIR)/ft_list_merge.c \
            $(LIST_DIR)/ft_list_push_back.c \
            $(LIST_DIR)/ft_list_push_front.c \
            $(LIST_DIR)/ft_list_push_strs.c \
            $(LIST_DIR)/ft_list_remove_if.c \
            $(LIST_DIR)/ft_list_reverse.c \
            $(LIST_DIR)/ft_list_reverse_fun.c \
            $(LIST_DIR)/ft_list_size.c \
            $(LIST_DIR)/ft_list_sort.c \
            $(LIST_DIR)/ft_sorted_list_insert.c \
            $(LIST_DIR)/ft_sorted_list_merge.c

BTREE_SRCS = $(BTREE_DIR)/btree_apply_by_level.c \
             $(BTREE_DIR)/btree_apply_infix.c \
             $(BTREE_DIR)/btree_apply_prefix.c \
             $(BTREE_DIR)/btree_apply_suffix.c \
             $(BTREE_DIR)/btree_create_node.c \
             $(BTREE_DIR)/btree_insert_data.c \
             $(BTREE_DIR)/btree_level_count.c \
             $(BTREE_DIR)/btree_search_item.c \
             $(BTREE_DIR)/btree_sorted_search_item.c

ALL_SRCS = $(LIST_SRCS) $(BTREE_SRCS)

ALL_OBJS = $(ALL_SRCS:.c=.o)

LIST_HEADER = $(LIST_DIR)/ft_list.h
BTREE_HEADER = $(BTREE_DIR)/ft_btree.h

all: $(NAME) clean

$(NAME): $(ALL_OBJS)
	@echo "Creating combined static library: $(NAME)"
	ar rcs $(NAME) $(ALL_OBJS)
	@echo "Library created successfully!"

$(LIST_DIR)/%.o: $(LIST_DIR)/%.c $(LIST_HEADER)
	gcc $(CFLAGS) -c $< -o $@

$(BTREE_DIR)/%.o: $(BTREE_DIR)/%.c $(BTREE_HEADER) $(LIST_HEADER)
	gcc $(CFLAGS) -I$(LIST_DIR) -c $< -o $@

test: $(NAME)
	gcc $(CFLAGS) -I$(LIST_DIR) -I$(BTREE_DIR) test_main.c $(NAME) -o test_complete

clean:
	rm -f $(ALL_OBJS)

fclean: clean
	rm -f $(NAME) test_complete

re: fclean all

show:
	@echo "Library contents:"
	ar -t $(NAME)

size:
	@ls -lh $(NAME)

.PHONY: all clean fclean re test show size
