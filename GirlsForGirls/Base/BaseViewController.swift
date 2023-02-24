//
//  BaseViewController.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation
import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    private lazy var backButton: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "back")
        view.frame = CGRect(x: 0, y: 0, width: 22.75, height: 14.63)
        view.isHidden = true
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        constraints()
        setupValues()
        view.addSubview(backButton)
        setupBack()
        view.backgroundColor = .cyan
    }
    
    func setupViews() {
        
    }
    
    func constraints() {
        
    }
    
    func setupValues() {
        
    }
    
    func setupBack() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    func enableBackButton(enable: Bool){
        if enable{
            backButton.isHidden = false
        }else {
            backButton.isHidden = true
        }
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
