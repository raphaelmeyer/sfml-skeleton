cmake_minimum_required(VERSION 3.10)

project(sfml-example)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

find_package(SFML REQUIRED COMPONENTS Graphics System Window)

add_executable(sfml-app src/main.cc)

target_link_libraries(sfml-app
  PRIVATE
    SFML::Graphics
    SFML::System
    SFML::Window
)
