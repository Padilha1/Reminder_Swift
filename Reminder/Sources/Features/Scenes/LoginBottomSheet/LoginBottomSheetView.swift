//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Matheus Padilha on 05/05/25.
//

import Foundation
import UIKit


class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetDelegate?
    
    private let title: UILabel = {
       let label = UILabel()
        label.text = "login.label.title".localized
        label.font = Typography.subHeading
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let emailTextLabel: UILabel = {
       let label = UILabel()
        label.text = "login.emaillabel.title".localized
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let passwordTextLabel: UILabel = {
       let label = UILabel()
        label.text = "login.passwordlabel.title".localized
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isSecureTextEntry = true
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginDidTapped), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
        
        let exampleGest = UITapGestureRecognizer(target: self, action: #selector(exampleTaped))
        title.addGestureRecognizer(exampleGest)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func exampleTaped(){
        print("clicou na tela")
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(title)
        addSubview(emailTextLabel)
        addSubview(emailTextField)
        addSubview(passwordTextLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextLabel.topAnchor.constraint(equalTo:title.bottomAnchor, constant: Metrics.medium),
            emailTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailTextLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputsize),
            
            passwordTextLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextLabel.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputsize),
            
//            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonsize)
        ])
    }
    
    @objc
    private func loginDidTapped(){
        let password = passwordTextField.text ?? ""
        let user = emailTextField.text ?? ""
        
        delegate?.sendLoginData(user: user, password: password)
    }
    
}
