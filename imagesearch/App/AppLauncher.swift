//
//  AppLauncher.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import SwiftUI

@main
struct AppLauncher {
    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            imagesearchApp.main()
        } else {
            TestApp.main()
        }
    }
}
