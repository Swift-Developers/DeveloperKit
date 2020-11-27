//
//  DeveloperKit.swift
//  DeveloperKit
//
//  Created by 方林威 on 2020/11/27.
//

import Foundation

enum DeveloperKit {
    
}

class BundleToken {}

extension Bundle {
    // This is copied method from SPM generated Bundle.module for CocoaPods support
    static func frameworkBundle() -> Bundle {

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleToken.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        let bundleNames = [
            // For Swift Package Manager
            "DeveloperKit_DeveloperKit",
            // For Carthage
            "DeveloperKit",
        ]

        for bundleName in bundleNames {
            for candidate in candidates {
                let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
                if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                    return bundle
                }
            }
        }

        // Return whatever bundle this code is in as a last resort.
        return Bundle(for: BundleToken.self)
    }
}

extension UIImage {
    
    static func resources(for name: String) -> UIImage {
        UIImage(named: name, in: Bundle.frameworkBundle(), compatibleWith: nil) ?? UIImage()
    }
}

