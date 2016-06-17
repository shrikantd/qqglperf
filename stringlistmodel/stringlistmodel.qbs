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

        name: "stringlistmodel"

        files: [
            "main.cpp",
            "stringlistmodel.qrc"
        ]

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installPrefix: "/opt/sd"
            qbs.installDir: "bin"
        }
    }
}
