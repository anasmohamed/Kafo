//
//  Localization.swift
//  kafo
//
//  Created by no one on 04/12/2021.
//

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
