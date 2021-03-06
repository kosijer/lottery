 # project name
    project (com.github.bartzaalberg.lottery)

    # the oldest stable cmake version we support
    cmake_minimum_required (VERSION 2.6)

    # tell cmake where its modules can be found in our project directory
    list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
    list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/src)

    # where we install data directory (if we have any)
    set (DATADIR "${CMAKE_INSTALL_PREFIX}/share")

    # what to call that directory where we install data too
    set (PKGDATADIR "${DATADIR}/com.github.bartzaalberg.lottery")

    set (EXEC_NAME "com.github.bartzaalberg.lottery")
    set (VERSION "0.1")
    set (VERSION_INFO "initial setup")

    set (DEPS_PACKAGES
        gtk+-3.0
        granite
    )

    find_package (PkgConfig)
    pkg_check_modules (DEPS REQUIRED ${DEPS_PACKAGES})


    add_definitions(${DEPS_CFLAGS})
    link_libraries(${DEPS_LIBRARIES})
    link_directories(${DEPS_LIBRARY_DIRS})

    # make sure we have vala
    find_package(Vala REQUIRED)
    # make sure we use vala
    include(ValaVersion)
    # make sure it's the desired version of vala
    ensure_vala_version("0.16" MINIMUM)

    #------------------------------------------------------------------------------------------
    
    # files we want to compile
    include(ValaPrecompile)
    vala_precompile(VALA_C ${EXEC_NAME}
        src/Application.vala
        src/MainWindow.vala
        src/ListBoxRow.vala
        src/ListBox.vala
        src/EntryManager.vala
        src/Constants.vala
        src/StackManager.vala
        src/ListManager.vala
        src/Dialogs/Alert.vala
        src/Dialogs/AddEntry.vala
        src/Dialogs/DeleteConfirm.vala
        src/Dialogs/Cheatsheet.vala
        src/Views/ListView.vala
        src/Views/NotFoundView.vala
        src/Views/WelcomeView.vala
        src/Views/WinnerView.vala
        src/Components/HeaderBar.vala
        src/Components/HeaderLabel.vala

    # tell what libraries to use when compiling
    PACKAGES
        gtk+-3.0
        granite
    )

    # tell cmake what to call the executable we just made
    add_executable(${EXEC_NAME} ${VALA_C})

    # install the binaries we just made
    install (TARGETS ${EXEC_NAME} RUNTIME DESTINATION bin)

    #add the data directory and activated the cmakelists in that folder
    add_subdirectory (data)

    #add custom headerbar images to pixmap folder
    install (FILES data/icons/lottery.crown.svg DESTINATION /usr/share/pixmaps/)
