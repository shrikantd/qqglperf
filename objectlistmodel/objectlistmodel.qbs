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

        name: "objectlistmodel"

        files: [
            "main.cpp",
            "dataobject.cpp",
            "dataobject.h",
            "objectlistmodel.qrc"
        ]

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installPrefix: "/opt/sd"
            qbs.installDir: "bin"
        }
    }
}
