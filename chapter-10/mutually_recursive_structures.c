struct b;

struct a {
    int value;
    struct b *next;
};

struct b {
    struct a *other;
};