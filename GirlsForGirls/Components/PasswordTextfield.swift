//
//  PasswordTextfield.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 18.02.2023.
//

import UIKit
import SnapKit

class PasswordTextField: UITextField{
    
    private lazy var rightImageView: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "secure")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(secureTaped)))
        return view
    }()
    
    private lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        view.contentMode = .scaleToFill
        view.isHidden = false
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        setupViews()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(text: String){
        placeholder = text
        font = UIFont(name: "Inter-Light", size: 13)
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        isSecureTextEntry = true
        delegate = self
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return .init(x: 16, y: (bounds.height/2)-8, width: 18, height: 18)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return .init(x: bounds.width - 32, y: (bounds.height/2)-8, width: 20, height: 14)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: bounds.minX+16+18+8, y: bounds.minY, width: bounds.width-32-18-8-32, height: bounds.height)
        return rect
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: bounds.minX+16+18+8, y: bounds.minY, width: bounds.width-32-18-8-32, height: bounds.height)
        return rect
    }
    
    func isRightViewModeEnabled(isRightEnabled: Bool, rightImage: String) {
        rightImageView.image = UIImage(named: rightImage)
        
        switch isRightEnabled {
        case true:
            rightView = rightImageView
            rightViewMode = .always
        default:
            rightViewMode = .never
        }
    }
    
    func isLeftViewModeEnabled(isLeftEnabled: Bool, leftImage: String) {
        leftImageView.image = UIImage(named: leftImage)
        
        switch isLeftEnabled {
        case true:
            leftView = leftImageView
            leftViewMode = .always
        default:
            leftViewMode = .never
        }
    }
    
    private func setupViews(){
        //self.addSubview(rightImageView)
        //self.addSubview(leftImageView)
    }
    
    func constraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
           // make.width.equalTo(343)
        }
//        rightImageView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.trailing.equalToSuperview().inset(32)
//        }
        
//        leftImageView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().offset(32)
//        }
    }
    
    @objc func secureTaped() {
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
}

extension PasswordTextField: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return}
        
        if !text.isEmpty {
            leftImageView.isHidden = true
        }else {
            leftImageView.isHidden = false
        }
    }
    
}


