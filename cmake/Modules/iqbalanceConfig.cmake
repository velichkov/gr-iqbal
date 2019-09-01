if(NOT TARGET gnuradio::gnuradio-iqbalance)
    include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-iqbalanceTargets.cmake")
endif()

# set IQBALANCE_FOUND to be set globally, for whether a compatible gnuradio-iqbalance was
# found -- could be a correct enough version or any version depending
# on how find_package was called.
if(NOT TARGET gnuradio::gnuradio-iqbalance)
    set(IQBALANCE_FOUND FALSE)
else()
    set(IQBALANCE_FOUND TRUE)
endif()

# cache whether a compatible gnuradio-iqbalance was found for
# use anywhere in the calling project
set(IQBALANCE_FOUND ${IQBALANCE_FOUND} CACHE BOOL "Whether a compatible gnuradio-iqbalance was found" FORCE)

if(IQBALANCE_FOUND)
    # use the new target library, regardless of whether new or old style
    # we still need to set a variable with the library name so that there
    # is a variable to reference in the using-project's cmake scripts!
    set(IQBALANCE_LIBRARIES gnuradio::gnuradio-iqbalance CACHE STRING "gnuradio-iqbalance Library" FORCE)

    # INTERFACE_INCLUDE_DIRECTORIES should always be set
    get_target_property(IQBALANCE_INCLUDE_DIRS gnuradio::gnuradio-iqbalance INTERFACE_INCLUDE_DIRECTORIES)
    set(IQBALANCE_INCLUDE_DIRS ${IQBALANCE_INCLUDE_DIRS} CACHE STRING "gnuradio-iqbalance Include Directories" FORCE)

    # for backward compatibility with old-CMake non-target project finding
    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(IQBALANCE DEFAULT_MSG IQBALANCE_LIBRARIES IQBALANCE_INCLUDE_DIRS)
    mark_as_advanced(IQBALANCE_LIBRARIES IQBALANCE_INCLUDE_DIRS)
endif(IQBALANCE_FOUND)
