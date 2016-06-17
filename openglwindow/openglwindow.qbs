import qbs

Project {
    CppApplication {
        Depends {
            name: "Qt";
            submodules: [
                "gui",
                "widgets"
            ]
        }

        name: "openglwindow"

        files: [
            "main.cpp",
            "openglwindow.cpp",
            "openglwindow.h"
        ]
        property bool isEmbeddedDeviceBuild: qbs.sysroot && qbs.sysroot.contains("/dash2")

        Properties {
            condition: isEmbeddedDeviceBuild
            cpp.dynamicLibraries: outer.concat(["GLESv2"])
        }

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installPrefix: "/opt/sd"
            qbs.installDir: "bin"
        }
    }
}
