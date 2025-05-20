project(hw1_app)

set(hw1_app_src hw1.cpp)

add_executable(hw1_app ${hw1_app_src})
target_include_directories(hw1_app PRIVATE ${CMAKE_SOURCE_DIR}/inc)
target_link_libraries(hw1_app PRIVATE sorter)
