#include<stdio.h>
#include<malloc.h>
#define INSERT_FRONT 1
#define INSERT_BACK 2
#define ZERO_ASCII_CODE 48

struct node {
    int value;
    struct node* next;
};

struct linked_list
{
    struct node* head;
    int count;
};


struct node* list_create(const int n) {
    struct node *new_node = malloc(sizeof(struct node));
    new_node->value = n;
    new_node->next = NULL;
    return new_node;
}

void list_add_front(const int n, struct linked_list * const list) {
    if(list->head == NULL) {
        list->head = list_create(n);
    } else {
        struct node *new_node = list_create(n);
        new_node->next = list->head;
        list->head = new_node;
    }

    list->count++;
}


void list_add_back(const int n,  struct linked_list * const list) {
    if(list->head == NULL) {
        list->head = list_create(n);
    } else {
        struct node *current = list->head;
        
        while(current->next != NULL) {
            current = current->next;
        }

        current->next = list_create(n);
    }

    list->count++;
}

int list_length(const struct linked_list * const list) {
    return list->count;
}

int list_get(const int index, struct linked_list * const list) {
    if(index < 0 || index >= list->count) {
        return 0;
    }

    struct node *current = list->head;
    size_t i = 0;

    while(i < index) {
        current = current->next;
        i++;
    }

    return current->value;
}

int list_sum(struct linked_list*  list) {
    struct node *current = list->head;
    int sum = 0;

    while(current != NULL) {
        sum += current->value;
        current = current->next;
    }

    return sum;
}

void list_free(struct linked_list * const list) {
    struct node *current = list->head;
    struct node *next;

    while(current != NULL) {
        next = current->next;
        free(current);
        current = next;
    }

    free(list);
}

int main(int argc, char ** argv) {
    struct linked_list *list = malloc(sizeof(struct linked_list));
    size_t i;
    list->head = NULL;
    list->count = 0;
    int choice;

    for(i = 1; i < argc; i++) {
        const int n = *argv[i] - ZERO_ASCII_CODE;
        
        printf("Type 1 to insert %d at front, 2 to insert at back: ", n);
        scanf("%d", &choice);

        if(choice == INSERT_FRONT) {
            list_add_front(n, list);
        } else if(choice == INSERT_BACK) {
            list_add_back(n, list);
        }
    }

    printf("Element at %d: %d \n", 4, list_get(4, list));
    printf("Sum of elements: %d", list_sum(list));

    list_free(list);
    return 0;
}