add_library(hw1_sorter SHARED sorter.cpp)
target_include_directories(hw1_sorter PUBLIC ${CMAKE_SOURCE_DIR}/inc)
set_target_properties(hw1_sorter PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../..
)