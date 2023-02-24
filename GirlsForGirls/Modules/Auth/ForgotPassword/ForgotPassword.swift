//
//  ForgotPassword.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation
import UIKit
import SnapKit

class ForgotPassword: BaseViewController {
    
    private lazy var forgotPasswordTitle: Label = {
        let view = Label()
        view.configureLabel(text: "Восстановления \nпароля", fontSize: 32, weight: .semibold)
        return view
    }()
    
    private lazy var forgotPasswordSubTitle: Label = {
        let view = Label()
        view.configureLabel(text: "Введите код который мы отправили вам \nна +996 555454545", fontSize: 16, weight: .regular)
        return view
    }()
    
    private lazy var notReceivedText: Label = {
        let view = Label()
        view.configureLabel(text: "Не получили код?", fontSize: 14, weight: .regular)
        return view
    }()
    
    private lazy var sendAgainText: Label = {
        let view = Label()
        view.configureLabel(text: "Отправить повторно 01:00", fontSize: 14, weight: .regular)
        view.isUserInteractionEnabled = true
        view.textColor = .red
        return view
    }()
    
    private lazy var verifyStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalSpacing
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(boxe1)
        view.addArrangedSubview(boxe2)
        view.addArrangedSubview(boxe3)
        view.addArrangedSubview(boxe4)
        return view
    }()
    
    private lazy var boxe1: VerifyCodeFields = {
        let view = VerifyCodeFields()
        view.setup()
        view.delegate = self
        return view
    }()
    
    private lazy var boxe2: VerifyCodeFields = {
        let view = VerifyCodeFields()
        view.setup()
        view.delegate = self
        return view
    }()
    
    private lazy var boxe3: VerifyCodeFields = {
        let view = VerifyCodeFields()
        view.setup()
        view.delegate = self
        return view
    }()
    
    private lazy var boxe4: VerifyCodeFields = {
        let view = VerifyCodeFields()
        view.setup()
        view.delegate = self
        return view
    }()
    
    private lazy var verifyButton: Button = {
        let view = Button()
        view.setup(text: "Восстановить")
        view.addTarget(self, action: #selector(recover), for: .touchUpInside)
        return view
    }()
    
    var isTimerStart = true
    var counter = 60
    
    override func setupViews(){
        view.addSubview(verifyStack)
        view.addSubview(verifyButton)
        view.addSubview(forgotPasswordTitle)
        view.addSubview(forgotPasswordSubTitle)
        view.addSubview(notReceivedText)
        view.addSubview(sendAgainText)
        enableBackButton(enable: true)
    }
    
    override func constraints() {
        verifyStack.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width - 32)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
        }
        
        forgotPasswordSubTitle.snp.makeConstraints { make in
            make.bottom.equalTo(verifyStack.snp.top).offset(-13)
            make.leading.equalToSuperview().offset(16)
        }
        
        forgotPasswordTitle.snp.makeConstraints { make in
            make.bottom.equalTo(forgotPasswordSubTitle.snp.top).offset(-12)
            make.leading.equalToSuperview().offset(16)
        }
        
        notReceivedText.snp.makeConstraints { make in
            make.top.equalTo(verifyStack.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        sendAgainText.snp.makeConstraints { make in
            make.top.equalTo(notReceivedText.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
        }
        
        verifyButton.snp.makeConstraints { make in
            make.top.equalTo(verifyStack.snp.bottom).offset(75)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width - 32)
        }
    }
    
    @objc func recover() {
        let vc = SetNewPassword()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension ForgotPassword: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.length == 0 && textField.text?.count ?? 0 >= 1 {
              return false
          }
        
        if let text = textField.text, let range = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: range, with: string)
        
            switch textField {
             case boxe1 where updatedText.count == 1:
                boxe2.becomeFirstResponder()
             case boxe2 where updatedText.count == 1:
                boxe3.becomeFirstResponder()
             case boxe3 where updatedText.count == 1:
                boxe4.becomeFirstResponder()
             case boxe4 where updatedText.count == 1:
                boxe4.resignFirstResponder()
                self.view.endEditing(true)
             default:
                 break
             }
            textField.text = updatedText

            return false
        }
        return true
    }
}

