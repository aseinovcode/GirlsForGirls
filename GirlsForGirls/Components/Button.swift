//
//  Button.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation
import UIKit
import SnapKit

class Button: UIButton {
    
    
    
    init(){
        super.init(frame: .zero)
        setupViews()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(text: String) {
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Inter-Medium", size: 18)
        backgroundColor = UIColor(hexString: "#DB66E4")
        layer.cornerRadius = 10
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
    }
    
    func setupViews() {

    }
    
    func constraints(){
        self.snp.makeConstraints { make in
            make.height.equalTo(54)
        }
    }
}
