//
//  smsCodeFields.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation
import UIKit

class VerifyCodeFields: UITextField {
    
    init(){
        super.init(frame: .zero)
        setupViews()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        placeholder = "-"
        layer.borderWidth = 1
        layer.borderColor = UIColor(hexString: "#DB66E4").cgColor
        backgroundColor = .white
        textAlignment = .center
        delegate = self
        layer.cornerRadius = 10
    }
    
    func setupViews() {
        
    }
    
    func constraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(70)
        }
    }
}

extension VerifyCodeFields: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return}

        if !text.isEmpty {
            backgroundColor = UIColor(hexString: "#DB66E4")
        }else {
            backgroundColor = .white
        }
    }
}
