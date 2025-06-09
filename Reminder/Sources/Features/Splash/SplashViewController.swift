//
//  SplashViewController.swift
//  Reminder
//
//  Created by Matheus Padilha on 01/05/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController{
    let contentView = SplashView()
    public weak var flowDelegate: SplashFlowDelegate?
    
    init(flowDelegate: SplashFlowDelegate){
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setup()
        
    }
    private func setup(){
        self.view.addSubview(contentView)
        self.view.backgroundColor = Colors.primaryRedBase
        setupGesture()
        setupConstraints()
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 0),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 0)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet(){
        self.flowDelegate?.openLoginBottomSheet()
    }
}


