# Install script for directory: /home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/src/exam1_turtle_control

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/install/exam1_turtle_control")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control/environment" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/pythonpath.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control/environment" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/pythonpath.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/exam1_turtle_control-0.0.0-py3.10.egg-info" TYPE DIRECTORY FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_python/exam1_turtle_control/exam1_turtle_control.egg-info/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/exam1_turtle_control" TYPE DIRECTORY FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/src/exam1_turtle_control/exam1_turtle_control/" REGEX "/[^/]*\\.pyc$" EXCLUDE REGEX "/\\_\\_pycache\\_\\_$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(
        COMMAND
        "/usr/bin/python3.10" "-m" "compileall"
        "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/install/exam1_turtle_control/local/lib/python3.10/dist-packages/exam1_turtle_control"
      )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control" TYPE PROGRAM FILES
    "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/src/exam1_turtle_control/scripts/Foxy_controller.py"
    "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/src/exam1_turtle_control/scripts/Foxy_scheduler.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control/cpp_node_test" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control/cpp_node_test")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control/cpp_node_test"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control" TYPE EXECUTABLE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/cpp_node_test")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control/cpp_node_test" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control/cpp_node_test")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control/cpp_node_test"
         OLD_RPATH "/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/exam1_turtle_control/cpp_node_test")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control" TYPE DIRECTORY FILES
    "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/src/exam1_turtle_control/launch"
    "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/src/exam1_turtle_control/config"
    "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/src/exam1_turtle_control/via_point"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/exam1_turtle_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/exam1_turtle_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control/environment" TYPE FILE FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control/environment" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control/environment" TYPE FILE FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control/environment" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_index/share/ament_index/resource_index/packages/exam1_turtle_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control/cmake" TYPE FILE FILES
    "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_core/exam1_turtle_controlConfig.cmake"
    "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/ament_cmake_core/exam1_turtle_controlConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/exam1_turtle_control" TYPE FILE FILES "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/src/exam1_turtle_control/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/peerawat/Documents/GitHub/FRA501_exam1_6443_6471/FRA501_6443_6471_WS/build/exam1_turtle_control/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
