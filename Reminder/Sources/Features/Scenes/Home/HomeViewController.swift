//
//  HomeViewController.swift
//  Reminder
//
//  Created by Matheus Padilha on 09/06/25.
//

import Foundation
import UIKit


class HomeViewController: UIViewController {
    let contentView: HomeView
    let flowDelegate: HomeFlowDelegate
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }

    private func setup() {
        view.addSubview(contentView)
        buildHierarchy()
    }
    private func setupNavigationBar(){
        navigationItem.hidesBackButton = true
        let logoutButton = UIBarButtonItem(
            image: UIImage(named: "log-out"),
            style: .plain, target: self, action: #selector(logoutAction)
        )
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
 
    private func buildHierarchy(){
//        NSLayoutConstraint.activate(<#T##constraints: [NSLayoutConstraint]##[NSLayoutConstraint]#>)
//        contentView.constraints
        setupContentViewToBounds(contentView: contentView)
        NSLayoutConstraint.activate([
            
        ])
    }
    
    @objc
    private func logoutAction(){
        print("Deslogou")
    }
}
