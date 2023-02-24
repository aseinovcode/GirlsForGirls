//
//  SetNewPassword.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation
import UIKit
import SnapKit

class SetNewPassword: BaseViewController {
    
    private lazy var choosePasswordTitle: UILabel = {
        let view = UILabel()
        view.text = "Выбероите новый \nпароль"
        view.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var choosePasswordSubTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textAlignment = .left
        view.text = "Помогите обезопасить свою учетную \nзапись"
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var newPassword: TextField = {
        let view = TextField()
        view.setup(text: "Новый пароль")
        view.setLeftPaddingPoints(10)
        return view
    }()
    
    private lazy var verifyNewPassword: TextField = {
        let view = TextField()
        view.setup(text: "Подтвердить новый пароль")
        view.setLeftPaddingPoints(10)
        return view
    }()
    
    private lazy var recoverStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.alignment = .fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(newPassword)
        view.addArrangedSubview(verifyNewPassword)
        return view
    }()
    
    private lazy var sendButton: Button = {
        let view = Button()
        view.setup(text: "Отправить")
        view.addTarget(self, action: #selector(sendNewPassword), for: .touchUpInside)
        return view
    }()
    
    override func setupViews(){
        view.addSubview(recoverStack)
        view.addSubview(choosePasswordSubTitle)
        view.addSubview(choosePasswordTitle)
        view.addSubview(sendButton)
        enableBackButton(enable: true)
    }
    
    override func constraints() {
        recoverStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(110)
            make.width.equalTo(view.frame.width - 32)
            make.centerX.equalToSuperview()
        }

        choosePasswordSubTitle.snp.makeConstraints { make in
            make.bottom.equalTo(recoverStack.snp.top).offset(-13)
            make.leading.equalToSuperview().offset(16)
        }

        choosePasswordTitle.snp.makeConstraints { make in
            make.bottom.equalTo(choosePasswordSubTitle.snp.top).offset(-12)
            make.leading.equalToSuperview().offset(16)
        }
        
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(recoverStack.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width - 32)
        }
    }
    
    @objc func sendNewPassword() {
        print("sendButton tapped")
        let vc = Welcome()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
