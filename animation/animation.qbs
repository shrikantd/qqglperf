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

        name: "animation"

        files: [
            "main.cpp",
            "animation.qrc",
            "../shared/shared.qrc"
        ]

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installPrefix: "/opt/sd"
            qbs.installDir: "bin"
        }
    }
}
