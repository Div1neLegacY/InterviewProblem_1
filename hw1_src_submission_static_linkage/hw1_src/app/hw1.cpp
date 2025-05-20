#include <iostream>
#include <cstddef>
#include <cstdlib>
#include <dlfcn.h>

#include <sorter.hpp>

/* QUESTION 1: what am I doing here with the namespace { } statement? */
/* ANSWER: This is an unnamed namespace, essentially a more modern way of doing static functions / global variables.
This allows us to define symbols specific to this hw1 compilation unit, allowing us to adhere to the ODR "One Definition Rule"
even when other compiled files have a symbol or function definition of the same name. I don't suggest putting any technical code related
to the class itself here, just seems like a good way to define some quick "helper" functions for basic functionality and computation.
One concern I had here, was that in doing namespaces like this, might cause issues with code testing down the road. At least with
software like googletest, we can still test code like this here, but for other testing softwares, this could cause issues? */
namespace {
    /* QUESTION 2: what is the reason for templatizing this function? how does that help us later on if we were
     * to use this function as part of an EFSI library of tools we create? */
     /* ANSWER: We template this function because it is a "common" function that can be used with many other data types. Typename C
     can be deduced as different types of data, allowing us to avoid writting redundant code here. */
    template<typename C> void print_array(const std::vector<C>& array)
    {
        for (C val : array) {
            std::cout << val << " "; // yes this always put a space at the end. so what?
        }
        std::cout << std::endl;
    }
}

int main()
{
    std::vector<int> input = { 123, 321, 456, 654, 789, 987, 111, 222, 555, 444, 999, 1, 7, 42 };
    
    print_array<int>(input);
    sort(input);
    print_array<int>(input);
    
    return 0;
}

    