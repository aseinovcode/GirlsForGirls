//
//  Label.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 22.02.2023.
//

import Foundation
import UIKit

class Label: UILabel {
    
    init() {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel(text: String, fontSize: Int, weight: UIFont.Weight) {
        self.text = text
        font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: weight)
        textAlignment = .left
        numberOfLines = 0
    }
    
    func setupViews() {
        
    }
    
    func constraints() {
        
    }
    
}
