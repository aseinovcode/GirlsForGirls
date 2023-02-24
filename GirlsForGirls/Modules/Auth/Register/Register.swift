//
//  Register.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation
import UIKit
import SnapKit

class ResgisterViewController: BaseViewController {
    
    private lazy var registerTitle: UILabel = {
        let view = UILabel()
        view.text = "Регистрация"
        view.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var checkButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(checkTapped), for: .touchUpInside)
        view.setImage(UIImage(named: "circle"), for: .normal)
        view.setImage(UIImage(named: "checkmark"), for: .selected)
        return view
    }()
    
    private lazy var agreementTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textAlignment = .left
        view.text = "Я согласен с условиями \nпользовательского соглашения"
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var registerStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(nameField)
        view.addArrangedSubview(phoneField)
        view.addArrangedSubview(mailField)
        view.addArrangedSubview(passwordField)
        view.addArrangedSubview(verifyPasswordField)
        return view
    }()
    
    private lazy var registerButton: Button = {
        let view = Button()
        view.setup(text: "Далее")
        view.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        view.isEnabled = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var nameField: TextField = {
        let view = TextField()
        view.setup(text: "Имя и Фамилия")
        view.setLeftPaddingPoints(10)
        return view
    }()
    
    private lazy var phoneField: TextField = {
        let view = TextField()
        view.setup(text: "Номер телефона")
        view.setLeftPaddingPoints(10)
        return view
    }()
    
    private lazy var mailField: TextField = {
        let view = TextField()
        view.setup(text: "e-mail")
        view.setLeftPaddingPoints(10)
        return view
    }()
    
    private lazy var passwordField: TextField = {
        let view = TextField()
        view.setup(text: "Пароль")
        view.setLeftPaddingPoints(10)
        return view
    }()
    
    private lazy var verifyPasswordField: TextField = {
        let view = TextField()
        view.setup(text: "Подтвердить пароль")
        view.setLeftPaddingPoints(10)
        return view
    }()
    
    override func setupViews() {
        enableBackButton(enable: true)
        view.addSubview(registerStack)
        view.addSubview(registerButton)
        view.addSubview(registerTitle)
        view.addSubview(containerView)
        containerView.addSubview(checkButton)
        containerView.addSubview(agreementTitle)
    }
    
    override func constraints() {
        registerStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width - 32)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(registerStack.snp.bottom).offset(75)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width - 32)
        }
        
        registerTitle.snp.makeConstraints { make in
            make.bottom.equalTo(registerStack.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(16)
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(34)
            make.top.equalTo(registerStack.snp.bottom).offset(16)
        }
        
        checkButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(25)
            make.centerY.equalToSuperview()
        }
        
        agreementTitle.snp.makeConstraints { make in
            make.leading.equalTo(checkButton.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func registerButtonTapped() {
        print("Register tapped")
        let vc = ChooseCityViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func checkTapped() {
        print("check tapped")
        checkButton.isSelected = !checkButton.isSelected
        if checkButton.isSelected{
            registerButton.isEnabled = true
            registerButton.backgroundColor = UIColor(hexString: "#DB66E4")
        }else {
            registerButton.isEnabled = false
            registerButton.backgroundColor = .lightGray
        }
    }
}
