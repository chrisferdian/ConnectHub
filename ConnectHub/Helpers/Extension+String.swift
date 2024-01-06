//
//  Extension+String.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import Foundation
extension String {
    // Formats the string as a username by adding "@" and converting to lowercase.
    var usernameFormat: String {
        return String(format: "@%@", self).lowercased()
    }
}
