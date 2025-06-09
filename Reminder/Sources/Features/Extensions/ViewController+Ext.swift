//
//  ViewController+Ext.swift
//  Reminder
//
//  Created by Matheus Padilha on 09/06/25.
//

import Foundation
import UIKit

extension UIViewController {
    func setupContentViewToBounds(contentView: UIView){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

