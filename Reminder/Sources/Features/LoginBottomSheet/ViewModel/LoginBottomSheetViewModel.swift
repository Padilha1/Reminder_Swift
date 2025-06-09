//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Matheus Padilha on 02/06/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: (() -> Void)?
    
    func doAuth(usernameLogin: String, password: String){
        Auth.auth().signIn(withEmail: usernameLogin, password: password) {
            [weak self] authResult, error in
            if let error = error {
                print("Autenticacao falhou \(error)")
            } else {
                self?.successResult?()
            }
        }
    }
}
