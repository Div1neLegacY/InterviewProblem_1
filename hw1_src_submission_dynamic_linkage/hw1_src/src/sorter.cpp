#include "sorter.hpp"
#include <algorithm>

class TestSorter : public sorter {
public:
    void sort(int *ints, uint32_t num_ints) override
    {
        std::sort(ints, ints + num_ints);
    }
};

extern "C" sorter* make_sorter() {
    return new TestSorter();
}