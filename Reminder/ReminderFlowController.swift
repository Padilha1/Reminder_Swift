
//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Matheus Padilha on 09/06/25.
//

import Foundation
import UIKit

class ReminderFlowController {

    
    //MARK: - Properties
    private var navigationController: UINavigationController?
    private var viewControllerFactory: ViewControllerFactoryProtocol
    
    
    //MARK: - Init
    
    
    public init() {
        self.viewControllerFactory = ViewControllerFactory()
    }
    
//    required init(coder aDecoder: NSCoder)
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
        
        func navigateToHome() {
            self.navigationController?.dismiss(animated: false)
            let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: - Home
extension ReminderFlowController: HomeFlowDelegate {

}
