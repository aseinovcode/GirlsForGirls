//
//  ViewController.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 18.02.2023.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
    
    private lazy var logo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        return view
    }()
    
    private lazy var loginStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.alignment = .fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(loginField)
        view.addArrangedSubview(passwordField)
        return view
    }()
    
    private lazy var loginLabel: UILabel = {
        let view = UILabel()
        view.text = "Вход"
        view.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        return view
    }()

    private lazy var loginField: TextField = {
        let view = TextField()
        view.setup(text: "Phone number")
        view.isViewModesEnabled(isLeftEnabled: true, leftImage: "phone")
        return view
    }()
    
    private lazy var passwordField: PasswordTextField = {
        let view = PasswordTextField()
        view.setup(text: "Password")
        view.isRightViewModeEnabled(isRightEnabled: true, rightImage: "secure")
        view.isLeftViewModeEnabled(isLeftEnabled: true, leftImage: "lock")
        return view
    }()
    
    private lazy var loginButton: Button = {
        let view = Button()
        view.setup(text: "Войти")
        view.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var forgotPasswordLabel: UILabel = {
        let view = UILabel()
        view.text = "Забыли пароль?"
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(forgotPaasswordTapped)))
        return view
    }()
    
    private lazy var registerLabel: UILabel = {
        let view = UILabel()
        view.text = "Зарегистрироваться"
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor(hexString: "#DB66E4")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerTapped)))
        return view
    }()
    
    override func setupViews() {
        view.addSubview(loginStack)
        view.addSubview(logo)
        view.addSubview(loginLabel)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(registerLabel)
    }
    
    override func constraints() {
        
        loginStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(110)
            make.width.equalTo(view.frame.width - 32)
            make.centerX.equalToSuperview()
        }
        
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(loginStack.snp.top).offset(-78)
            make.width.equalTo(126)
            make.height.equalTo(101)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.bottom.equalTo(loginStack.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(loginStack.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width - 32)
        }
        
        forgotPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func loginButtonTapped() {
        print("login tapped")
    }
    
    @objc func forgotPaasswordTapped() {
        print("Forgot Pass")
        let vc = ForgotPassword()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func registerTapped() {
        print("register tapped")
        let vc = ResgisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

