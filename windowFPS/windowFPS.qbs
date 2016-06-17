import qbs

Project {
    CppApplication {
        Depends {
            name: "Qt";
            submodules: [
                "gui"
            ]
        }

        name: "windowFPS"

        files: [
            "main.cpp",
            "window.cpp",
            "window.h",
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
