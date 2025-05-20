project(hw1_app)

set(hw1_app_src hw1.cpp)

add_executable(hw1_app ${hw1_app_src})
target_link_libraries(hw1_app dl)
