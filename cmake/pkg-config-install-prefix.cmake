option(PKG_CONFIG_RELOCATABLE "Generate relocatable pkg-config files" ON)
if (PKG_CONFIG_RELOCATABLE)
    file(RELATIVE_PATH PKG_CONFIG_INSTALL_REL ${CMAKE_INSTALL_FULL_LIBDIR}/pkgconfig ${CMAKE_INSTALL_PREFIX})
    if (PKG_CONFIG_INSTALL_REL MATCHES "/$")
        string(LENGTH ${PKG_CONFIG_INSTALL_REL} PKG_CONFIG_INSTALL_REL_LEN)
        math(EXPR PKG_CONFIG_INSTALL_REL_LEN "${PKG_CONFIG_INSTALL_REL_LEN} - 1")
        string(SUBSTRING ${PKG_CONFIG_INSTALL_REL} 0 ${PKG_CONFIG_INSTALL_REL_LEN} PKG_CONFIG_INSTALL_REL)
    endif()
    set(PKG_CONFIG_INSTALL_PREFIX "\${pcfiledir}/${PKG_CONFIG_INSTALL_REL}")
else()
    set(PKG_CONFIG_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
endif()
set(PKG_CONFIG_PC_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
