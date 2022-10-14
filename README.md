# IP
![Build](https://github.com/sroik/ip/actions/workflows/build.yml/badge.svg)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
[![Swift](https://img.shields.io/badge/swift-5-orange)](./)

## Installation

### Swift Package Manager (xcode):

To integrate using the Xcode-built-in SPM, choose `File` → `Swift Packages` → `Add Package Dependency`. Enter the following url: `https://github.com/sroik/ip.git` and click `Next`. When asked about the version, leave the preselection and click `Next`. In the following step, select `IP` as the package product and click `Finish`.

### Swift Package Manager (standalone)

To integrate using the standalone version of Apple's Swift Package Manager, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/sroik/ip.git", .upToNextMajor(from: "1.0.0"))
```

After specifying `"IP"` as a dependency of the target in which you want to use it, run `swift package update`.

## Usage

```swift
import IP

let allAdresses = IP.search()
let wifiIPv4Adress = IP.search(families: [.IPv4], interfaces: [.en0])
```