#include "libmb.h"
#include <stdio.h>
#include <stdlib.h>

// Comparison function for integers
int ft_intcmp(void *num1, void *num2) {
    return *(int*)num1 - *(int*)num2;
}

// Print function for integers
void ft_print_int(void *data) {
    printf("%d ", *(int*)data);
}

// Print function with level information
void ft_print_int_level(void *item, int current_level, int is_first_elem) {
    if (is_first_elem && current_level > 0)
        printf("\n");
    if (is_first_elem)
        printf("Level %d: ", current_level);
    printf("%d ", *(int*)item);
}

int main() {
    printf("=== Testing Combined Library ===\n\n");
    
    // Test list functions
    printf("Testing List Functions:\n");
    t_list *list = NULL;
    int values[] = {1, 2, 3, 4, 5};
    
    for (int i = 0; i < 5; i++) {
        ft_list_push_back(&list, &values[i]);
    }
    
    printf("List contents: ");
    ft_list_foreach(list, ft_print_int);
    printf("\nList size: %d\n\n", ft_list_size(list));
    
    // Test btree functions
    printf("Testing Btree Functions:\n");
    t_btree *btree = NULL;
    int btree_values[] = {5, 3, 8, 1, 4, 7, 9};
    
    for (int i = 0; i < 7; i++) {
        btree_insert_data(&btree, &btree_values[i], ft_intcmp);
    }
    
    printf("Btree infix: ");
    btree_apply_infix(btree, ft_print_int);
    printf("\n");
    
    printf("Btree by level:");
    btree_apply_by_level(btree, ft_print_int_level);
    printf("\n\n");
    
    // Clean up
    ft_list_clear(list, NULL);
    
    printf("All tests completed successfully!\n");
    return 0;
}
