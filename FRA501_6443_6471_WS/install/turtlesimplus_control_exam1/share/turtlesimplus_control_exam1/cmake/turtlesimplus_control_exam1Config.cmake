# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_turtlesimplus_control_exam1_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED turtlesimplus_control_exam1_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(turtlesimplus_control_exam1_FOUND FALSE)
  elseif(NOT turtlesimplus_control_exam1_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(turtlesimplus_control_exam1_FOUND FALSE)
  endif()
  return()
endif()
set(_turtlesimplus_control_exam1_CONFIG_INCLUDED TRUE)

# output package information
if(NOT turtlesimplus_control_exam1_FIND_QUIETLY)
  message(STATUS "Found turtlesimplus_control_exam1: 0.0.0 (${turtlesimplus_control_exam1_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'turtlesimplus_control_exam1' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${turtlesimplus_control_exam1_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(turtlesimplus_control_exam1_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${turtlesimplus_control_exam1_DIR}/${_extra}")
endforeach()
