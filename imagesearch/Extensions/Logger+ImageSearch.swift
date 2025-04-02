//
//  Logger.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/3/25.
//

import OSLog

extension Logger {
    private static let bundleID = Bundle.main.bundleIdentifier ?? "dev.solosoftware.arbol"
    static let imageLoader = Logger(subsystem: bundleID, category: "Image Loader")
    static let userInteraction = Logger(subsystem: bundleID, category: "User Interaction")
    static let testing = Logger(subsystem: bundleID, category: "Testing")
}
