//
//  HeaderView.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 23.02.2023.
//

import Foundation
import UIKit
import SnapKit

class HeaderView: UIView {
    
    private lazy var headerStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 20
        view.addArrangedSubview(profileImage)
        view.addArrangedSubview(titleStack)
        view.addArrangedSubview(notificationIcon)
        view.distribution = .fill
        return view
    }()
    
    private lazy var titleStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .fill
        view.addArrangedSubview(title)
        view.addArrangedSubview(subTitle)
        return view
    }()
    
    private lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.frame = CGRect(x: 0, y: 0, width: 57, height: 59)
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = CGFloat(view.frame.width / 2)
        return view
    }()
    
    private lazy var title: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.font = UIFont(name: "Poppins-SemiBold", size: 20)
        return view
    }()
    
    private lazy var subTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.429, green: 0.429, blue: 0.429, alpha: 1)
        view.font = UIFont(name: "Poppins-Medium", size: 15)
        return view
    }()
    
    private lazy var notificationIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "push")
       // view.frame = CGRect(x: 0, y: 0, width: 19.87, height: 19.44)
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraints()
    }
    
    func setupViews(){
        addSubview(headerStack)
    }
    
    func constraints() {
        headerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints { make in
            make.width.equalTo(57)
            make.height.equalTo(59)
        }
        
        notificationIcon.snp.makeConstraints { make in
            make.width.equalTo(30.87)
            make.height.equalTo(30.44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillHeader(title: String, subTitle: String, profileImage: UIImage) {
        self.profileImage.image = profileImage
        self.title.text = title
        self.subTitle.text = subTitle
    }
    
    
}
