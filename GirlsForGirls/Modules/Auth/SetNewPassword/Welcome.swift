//
//  Welcome.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation
import UIKit
import SnapKit

class Welcome: BaseViewController {
    
    private lazy var welcomeImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "welcome")
        view.frame =  CGRect(x: 0, y: 0, width: 266, height: 291)
        return view
    }()
    
    private lazy var continueButton: Button = {
        let view = Button()
        view.setup(text: "Продолжить")
        view.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        return view
    }()
    
    override func setupViews() {
        view.addSubview(welcomeImageView)
        view.addSubview(continueButton)
    }
    
    override func constraints() {
        welcomeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-80)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(welcomeImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width - 32)
        }
    }
    
    override func setupValues() {
        
    }
    
    @objc func continueTapped() {
        print("Continue Tapped")
        let vc = TabBarController()
        
        //let window = SceneDelegate.shared.window
        //SceneDelegate.shared.changeRootViewController(to: vc, in: window)
    }
    
}
