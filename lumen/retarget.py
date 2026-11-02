#!/usr/bin/env python3
"""Re-points the build system at this fork after a sync from upstream.

Idempotent on purpose: the sync workflow runs it on a fresh upstream/main every time, so the
fork's whole delta is patches (Sources/BuildScripts/patch/) plus whatever this script rewrites.
"""
import pathlib, re, sys

MAIN = pathlib.Path("Sources/BuildScripts/XCFrameworkBuild/main.swift")
MOLTENVK_ALL = "https://github.com/gokberkince/MPVKit/releases/download/0.41.0-lumen.2/MoltenVK-all.zip"

s = MAIN.read_text()
s = s.replace("mpvkit/MPVKit/releases", "gokberkince/MPVKit/releases")
s, n = re.subn(r'case \.vulkan:\n\s*return "https://[^"]*"',
               f'case .vulkan:\n            return "{MOLTENVK_ALL}"', s, count=1)
if n != 1:
    sys.exit("vulkan URL template not found — upstream moved it, update lumen/retarget.py")
MAIN.write_text(s)
TARGET = re.compile(r'name: "MoltenVK",\n\s*url: "[^"]*",\n\s*checksum: "[^"]*"')
s2 = MAIN.read_text()
CKURL = MOLTENVK_ALL.replace("MoltenVK-all.zip", "MoltenVK.xcframework")
s2, n2 = TARGET.subn('name: "MoltenVK",\n                    url: "%s.zip",\n                    checksum: "%s.checksum.txt"' % (CKURL, CKURL), s2, count=1)
if n2 != 1:
    sys.exit("MoltenVK targets template not found — update lumen/retarget.py")
MAIN.write_text(s2)
print("retargeted: hosts + MoltenVK asset + MoltenVK package template")
