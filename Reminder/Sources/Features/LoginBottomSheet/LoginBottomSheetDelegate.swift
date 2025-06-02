//
//  LoginBottomSheetDelegate.swift
//  Reminder
//
//  Created by Matheus Padilha on 19/05/25.
//


import Foundation
import UIKit


protocol LoginBottomSheetDelegate: AnyObject {
    func sendLoginData(user: String, password: String){
        
    }
}
