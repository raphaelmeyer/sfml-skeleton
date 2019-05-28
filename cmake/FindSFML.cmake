# Find SFML
include(FindPackageHandleStandardArgs)

function(find_component NAME)
  set(HEADER_NAME "${NAME}.hpp")
  string(TOLOWER "sfml-${NAME}" LIB_NAME)

  find_path(SFML_${NAME}_INCLUDE_DIR
    NAMES "${HEADER_NAME}"
    PATH_SUFFIXES "SFML"
  )
  find_library(SFML_${NAME}_LIBRARY
    NAMES "${LIB_NAME}"
  )

  find_package_handle_standard_args(SFML_${NAME}
    FOUND_VAR SFML_${NAME}_FOUND
    REQUIRED_VARS
      SFML_${NAME}_LIBRARY
      SFML_${NAME}_INCLUDE_DIR
  )

  add_library(SFML::${NAME} UNKNOWN IMPORTED)
  set_target_properties(SFML::${NAME} PROPERTIES
    IMPORTED_LOCATION "${SFML_${NAME}_LIBRARY}"
    INTERFACE_INCLUDE_DIRECTORIES "${SFML_${NAME}_INCLUDE_DIR}"
  )

  mark_as_advanced(
    SFML_${NAME}_LIBRARY
    SFML_${NAME}_INCLUDE_DIR
  )

  set(SFML_${NAME}_FOUND "${SFML_${NAME}_FOUND}" PARENT_SCOPE)
endfunction(find_component)

find_component(Audio)
find_component(Graphics)
find_component(Network)
find_component(System)
find_component(Window)

find_path(SFML_INCLUDE_DIR
  NAMES Main.hpp
  PATH_SUFFIXES "SFML"
)

find_package_handle_standard_args(SFML
  FOUND_VAR SFML_FOUND
  REQUIRED_VARS
    SFML_INCLUDE_DIR
  HANDLE_COMPONENTS
)

mark_as_advanced(SFML_INCLUDE_DIR)
