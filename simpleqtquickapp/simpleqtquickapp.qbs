import qbs

Project {
    CppApplication {
        Depends {
            name: "Qt";
            submodules: [
                "gui",
                "qml",
                "quick"
            ]
        }

        name: "simpleqtquickapp"

        files: [
            "main.cpp",
            "qml.qrc"
        ]

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installPrefix: "/opt/sd"
            qbs.installDir: "bin"
        }
    }
}
