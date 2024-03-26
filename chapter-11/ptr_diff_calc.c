int arr[128];
int *ptr1 = &arr[50];
int *ptr = &arr[90];

ptrdiff_t d = ptr - ptr1;