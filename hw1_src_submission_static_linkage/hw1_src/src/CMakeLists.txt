add_library(sorter SHARED sorter.cpp)
target_include_directories(sorter PUBLIC ${CMAKE_SOURCE_DIR}/inc)
set_target_properties(sorter PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../lib
)