// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v12), .iOS(.v15), .tvOS(.v15), .visionOS(.v1)],
    products: [
        .library(
            name: "MPVKit",
            targets: ["_MPVKit"]
        ),
        .library(
            name: "MPVKit-GPL",
            targets: ["_MPVKit-GPL"]
        ),
    ],
    targets: [
        .target(
            name: "_MPVKit",
            dependencies: [
                "Libmpv", "_FFmpeg", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg",
            dependencies: [
                "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),
        .target(
            name: "_MPVKit-GPL",
            dependencies: [
                "Libmpv-GPL", "_FFmpeg-GPL", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit-GPL",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg-GPL",
            dependencies: [
                "Libavcodec-GPL", "Libavdevice-GPL", "Libavfilter-GPL", "Libavformat-GPL", "Libavutil-GPL", "Libswresample-GPL", "Libswscale-GPL",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "Libsmbclient", "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg-GPL",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),

        .binaryTarget(
            name: "Libmpv-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libmpv-GPL.xcframework.zip",
            checksum: "7e2f1239b0876a0399faa3e9d161959427a34497ee1aa3938052b4bb564f02a3"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavcodec-GPL.xcframework.zip",
            checksum: "1ead12b49f9090ebe7c31c0fc3ad641d0657ef0dec987b3d7aa52c75c0f9ef51"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavdevice-GPL.xcframework.zip",
            checksum: "e39310346327f1c1cc689844a07d3ca57f07e94eb8cdd2f0f6e33136830e4d8d"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavformat-GPL.xcframework.zip",
            checksum: "342dae36c0fa3c636f99653631ac4447d7365bfc35110ac36318c25d0f2eb837"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavfilter-GPL.xcframework.zip",
            checksum: "128c67005869911f51f6a5695a09e903565584fa520f244dcae846a929b056be"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavutil-GPL.xcframework.zip",
            checksum: "a09ba364b23026aa263ef5559027be9f36452920cc6f35c510a130174f60db82"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libswresample-GPL.xcframework.zip",
            checksum: "f9516911d94ecaf52d162af77982f926c33bfc07c9edbe47a04bba0d5f92a621"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libswscale-GPL.xcframework.zip",
            checksum: "8e3555f37ad4a9fc23d1442e70d7c837f073a9d88482bbd667078e51d08e16c1"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libcrypto",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libcrypto.xcframework.zip",
            checksum: "593283be2a90f7fd66f6e6ed331b2f099cf403e0926fe3b4ac09a7062b793965"
        ),
        .binaryTarget(
            name: "Libssl",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libssl.xcframework.zip",
            checksum: "ff5ffd43d015d7285fd37e4a3145b25cbd8d2842740bd629a711c299a20e226a"
        ),

        .binaryTarget(
            name: "gmp",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gmp.xcframework.zip",
            checksum: "ad33c7a08f4cdcb9924c8f0e6d9a054dad33d7794b97667bf8b6fb2b236ae585"
        ),

        .binaryTarget(
            name: "nettle",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/nettle.xcframework.zip",
            checksum: "0fdf3ebf8bd7b8bc8eee837cf27261cb4c52ae520b6576a2f468656aa1691e02"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/hogweed.xcframework.zip",
            checksum: "25727c9fa67287fa0a4f4722f88bb8be669b23cd7e837e2d00870eb8a25d3f27"
        ),

        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gnutls.xcframework.zip",
            checksum: "3dbec5809339189bf9679e218c6cff387ebf8fb72745927835afc2678f5c9f4d"
        ),

        .binaryTarget(
            name: "Libunibreak",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libunibreak.xcframework.zip",
            checksum: "940d9833cf4477d0a260d9f2b4066125bc0ff7bbc111ac3c90e774765b77a559"
        ),

        .binaryTarget(
            name: "Libfreetype",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libfreetype.xcframework.zip",
            checksum: "496ca62488530e14b1e4624d20ee2b237c0bd675cd70c19da578a5768302d02d"
        ),

        .binaryTarget(
            name: "Libfribidi",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libfribidi.xcframework.zip",
            checksum: "bc15e097b892f2f90424e4a27ba287070cc2f98a74a4da10e6d2481d15cf5ff9"
        ),

        .binaryTarget(
            name: "Libharfbuzz",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libharfbuzz.xcframework.zip",
            checksum: "aa8e0b9ca0387dac74e3e93c86e34d11982bb013b28022d0e6966a8427a35b2e"
        ),

        .binaryTarget(
            name: "Libass",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libass.xcframework.zip",
            checksum: "3f4c576d2818ceb4544aa2a20e1f55846511c5e706fd19adc3ea9fd842270498"
        ),

        .binaryTarget(
            name: "Libsmbclient",
            url: "https://github.com/mpvkit/libsmbclient-build/releases/download/4.15.13-2512/Libsmbclient.xcframework.zip",
            checksum: "3a53375fab11bc888cc553664ea5dd902208d04f0cc21ec746302bf356246b6f"
        ),

        .binaryTarget(
            name: "Libbluray",
            url: "https://github.com/mpvkit/libbluray-build/releases/download/1.4.0/Libbluray.xcframework.zip",
            checksum: "bc037d34e2b0b5ab7f202fb371f5fb298136cc66fdf406c2172185d06f53f18d"
        ),

        .binaryTarget(
            name: "Libuavs3d",
            url: "https://github.com/mpvkit/libuavs3d-build/releases/download/1.2.1-fix/Libuavs3d.xcframework.zip",
            checksum: "bd5256081486d16c51c868d755bf70266c424b54c895269580de44ec6707f789"
        ),

        .binaryTarget(
            name: "Libdovi",
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.2/Libdovi.xcframework.zip",
            checksum: "e693e239808350868e79c5448ef9f02e2716bc822dd8632a41a368a1eae5ca7d"
        ),

        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/gokberkince/moltenvk-build/releases/download/0.41.0-lumen.3/MoltenVK.xcframework.zip",
            checksum: "e8c8a4f4b029554dec6408f35cf3d1756ea59b0a52870e8978768d399bd2778f"
        ),

        .binaryTarget(
            name: "Libshaderc_combined",
            url: "https://github.com/mpvkit/libshaderc-build/releases/download/2025.5.0/Libshaderc_combined.xcframework.zip",
            checksum: "758047b615708575b580eb960a2d083f760a29dc462d6eaa360416c946ce433b"
        ),

        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/mpvkit/lcms2-build/releases/download/2.17.0/lcms2.xcframework.zip",
            checksum: "dc0dce0606f6ab6841a8ec5a6bd4448e2f3ef00661a050460f806c9393dc6982"
        ),

        .binaryTarget(
            name: "Libplacebo",
            url: "https://github.com/mpvkit/libplacebo-build/releases/download/7.360.1/Libplacebo.xcframework.zip",
            checksum: "2fa3d54cb81f302d6f11c7b2f509af30944381c3b11ee9d35096eb4637a6e2dd"
        ),

        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/mpvkit/libdav1d-build/releases/download/1.5.3/Libdav1d.xcframework.zip",
            checksum: "d1a32ae6a1f0193e9f05c44c9176844af7f6d2a58cb33843f6f1b8dfd9224083"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavcodec.xcframework.zip",
            checksum: "1828a01db280873d78fdddadd163239e5dc8fec5aefccbdb959891ca7747553d"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavdevice.xcframework.zip",
            checksum: "91955ec97abf67319ba6e6b2d4bf60ca706c91592d855949264cee072f08b8be"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavformat.xcframework.zip",
            checksum: "87eac06312a6c0ea15c2f33a65ea5013781678ddcd393cc1bdb138781bd0400b"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavfilter.xcframework.zip",
            checksum: "306be115e4cba638fe7af8c68d39bf02d45cd151865aaf050836ad9c61e5b538"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libavutil.xcframework.zip",
            checksum: "faef234d6db638f70df62c338187d6a86bf2a915be14fefa54d35802227aa2a6"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libswresample.xcframework.zip",
            checksum: "17a355f907668fbe9cbb822f2d59bbfb5bd3871f42ab2ac007924d2cc32264b4"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libswscale.xcframework.zip",
            checksum: "939db0cc390c58f242e3de83f1d3e2e9c3e887825cb27e6aaa4a87cda14276b5"
        ),

        .binaryTarget(
            name: "Libuchardet",
            url: "https://github.com/mpvkit/libuchardet-build/releases/download/0.0.8/Libuchardet.xcframework.zip",
            checksum: "ea4f548a230a755e059144657cc9e2ff563c1cdeae03974c38f8b6e1a40303fb"
        ),

        .binaryTarget(
            name: "Libluajit",
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0-fix/Libluajit.xcframework.zip",
            checksum: "3a171ef1627fb88260893dc452f989bd93dd8510814771ba3aff7753470d3f3e"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.11/Libmpv.xcframework.zip",
            checksum: "93d837aca9242baf58a78441ab24eb05fad7b6347a1115438be13ecdfd7d3d73"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
