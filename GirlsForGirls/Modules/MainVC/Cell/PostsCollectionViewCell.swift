//
//  PostsCollectionViewCell.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 23.02.2023.
//

import Foundation
import UIKit
import SnapKit

class PostsCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .fill
        view.addArrangedSubview(postTitle)
        view.addArrangedSubview(postSubTitle)
        return view
    }()
    
    private lazy var postImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var postTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return view
    }()
    
    private lazy var postSubTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.149, green: 0.196, blue: 0.22, alpha: 0.7)
        view.font = UIFont(name: "Poppins-Regular", size: 12)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var moreButton: Button = {
        let view = Button()
        view.setup(text: "Подробнее")
        return view
    }()
    
    private lazy var applyButton: Button = {
        let view = Button()
        view.setup(text: "Подать заявку")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(postImage)
        addSubview(postTitle)
        addSubview(postSubTitle)
        contentView.addSubview(moreButton)
        contentView.addSubview(applyButton)
    }
    
    func constraints(){
        postImage.snp.makeConstraints { make in
            make.width.equalTo(self.frame.width)
            make.height.equalTo(self.frame.height / 2 - 2)
            make.top.equalTo(self.snp.top)
        }
        
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom).offset(10)
            make.width.equalTo(self.frame.width - 32)
            make.centerX.equalToSuperview()
            make.height.equalTo(36 + 5 + 24)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(titleStack.snp.bottom).offset(10)
            make.width.equalTo((self.frame.width - 24) / 2 - 8)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(12)
        }
        
        applyButton.snp.makeConstraints { make in
            make.top.equalTo(titleStack.snp.bottom).offset(10)
            make.width.equalTo((self.frame.width - 24) / 2 - 8)
            make.height.equalTo(50)
            make.trailing.equalToSuperview().offset(-12)
        }
        
    }
    
}
