//
//  TextField.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 18.02.2023.
//

import Foundation
import UIKit
import SnapKit

class TextField: UITextField {
    
    private lazy var leftImageView: UIImageView = {
        let view = UIImageView()
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
        delegate = self
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return .init(x: 16, y: (bounds.height/2)-8, width: 18, height: 18)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: bounds.minX+16+18+8, y: bounds.minY, width: bounds.width-32-18-8-32, height: bounds.height)
        return rect
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: bounds.minX+16+18+8, y: bounds.minY, width: bounds.width-32-18-8-32, height: bounds.height)
        return rect
    }
    
    func isViewModesEnabled(isLeftEnabled: Bool, leftImage: String) {
        
        leftImageView.image = UIImage(named: leftImage)
    
        addSubview(leftImageView)
        
        switch isLeftEnabled {
        case true:
            leftView = leftImageView
            leftViewMode = .always
        default:
            leftViewMode = .never
        }
    }
    
    private func setupViews(){
        //self.addSubview(leftImageView)
//        self.addSubview(leftImageView)
    }
    
    func constraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(343)
        }
//        leftImageView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.width.equalTo(18)
//            make.height.equalTo(18)
//        }
    }
}

extension TextField: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return}
        
        if !text.isEmpty {
            leftImageView.isHidden = true
        }else {
            leftImageView.isHidden = false
        }
    }
    
}
