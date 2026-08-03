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
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libmpv-GPL.xcframework.zip",
            checksum: "7c4660d643cb7e260d086adbc2ecbf4e49efe3b9f379e18b5213480ed2504884"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavcodec-GPL.xcframework.zip",
            checksum: "d2bb7aad95b727adf9093727cc1ece598d4f8f6f5b3c42bcbe266f52d4be30f8"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavdevice-GPL.xcframework.zip",
            checksum: "fcb92041a9ed3a19d0a3e79d761dcbfcb62cc92b586fb37d34cd706901e226df"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavformat-GPL.xcframework.zip",
            checksum: "c52a6fc472a418a612540192227095898af4ecf6800d8a796b5733ae20ca9a65"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavfilter-GPL.xcframework.zip",
            checksum: "0bfb0bfa7cf1cbefd6ce54c444b686930cffe6c0007f4bbf3491daeb822db7d7"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavutil-GPL.xcframework.zip",
            checksum: "08b51830b82b62831b89b48860f6ae32c343ea592e98b6dfd24713f284cd2232"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libswresample-GPL.xcframework.zip",
            checksum: "024016884f986d8c4f46f7e46a58587149bf994d0348da5917e95d9ce680bfbe"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libswscale-GPL.xcframework.zip",
            checksum: "b65bfee20b2f488c83b8e2f81705597470ae650eac1891643b2c42145fc6d862"
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
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavcodec.xcframework.zip",
            checksum: "87c1d9f2716b428d83f5d91bfd7401bbbdb4f8c48a238071d453cfbddc69827b"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavdevice.xcframework.zip",
            checksum: "f7c20aac9d6fae5661d474963733903ea0f468e13ce9307678a156fdd6bfbd96"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavformat.xcframework.zip",
            checksum: "d87118c5a98f3c5201e8381494acc0c2adf07efeda5a6a651b14ecd704fad098"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavfilter.xcframework.zip",
            checksum: "ac12a007af6a1a1d283d33172d23fe7a8c1ed364e153101476a5d793fc432cb1"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libavutil.xcframework.zip",
            checksum: "28ae230e08053e16f03ac1d5a16e7b352634c6daeb7991787472b5e5bea99e3a"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libswresample.xcframework.zip",
            checksum: "ca8c585856ecaf33980a8dc4de0a63ff951879c2f174faf0ad033bec9a62dfc0"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libswscale.xcframework.zip",
            checksum: "04def46ef85658bd3aa901c100c76703f46b412af8a6141b78fb96ab2136ce0b"
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
            url: "https://github.com/gokberkince/MPVKit/releases/download/0.42.0-lumen.9/Libmpv.xcframework.zip",
            checksum: "f55d27c178a9015a38de5f24fb730f160b4aa5cbe3a29f6bda81387d32c74d3d"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
