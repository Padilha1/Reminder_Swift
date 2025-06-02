
//
//  String+ext.swift
//  Reminder
//
//  Created by Matheus Padilha on 19/05/25.
//

import Foundation

extension String{
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
