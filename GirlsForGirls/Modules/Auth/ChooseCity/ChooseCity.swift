//
//  ChooseCountry.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation

class ChooseCountryViewController: BaseViewController {
    
    private lazy var nameField: TextField = {
        let view = TextField()
        view.setup(text: "Имя и Фамилия")
        view.setLeftPaddingPoints(10)
        return view
    }()
    
    override func setupViews() {
        
    }
    
    override func constraints() {
        
    }
    
}
