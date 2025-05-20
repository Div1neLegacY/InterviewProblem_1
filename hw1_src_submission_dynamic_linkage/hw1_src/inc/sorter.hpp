#ifndef sorter__HPP
#define sorter__HPP

#include <stdint.h>
#define COUNTOF(x) (sizeof(x)/sizeof(*x))

class sorter {
public:
    virtual void sort(int *ints, uint32_t num_ints) = 0;
};

#endif
