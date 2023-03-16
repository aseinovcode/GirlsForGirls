//
//  PostsCollectionViewCell.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 23.02.2023.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

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
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
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
    
    private lazy var moreButton: UIButton = {
        let view = UIButton()
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "Inter-Medium", size: 18)
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(hexString: "#DB66E4").cgColor
        view.layer.borderWidth = 1
        view.setTitle("Подробнее", for: .normal)
        view.setTitleColor(UIColor(hexString: "#DB66E4"), for: .normal)
        return view
    }()
    
    private lazy var applyButton: UIButton = {
        let view = UIButton()
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "Inter-Medium", size: 18)
        view.backgroundColor = UIColor(hexString: "#DB66E4")
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(hexString: "#DB66E4").cgColor
        view.layer.borderWidth = 1
        view.setTitle("Подать заявку", for: .normal)
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.cornerRadius = 20
        setupViews()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(titleStack)
        contentView.addSubview(moreButton)
        contentView.addSubview(applyButton)
        addSubview(postImage)
    }
    
    func constraints(){
        postImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleStack.snp.makeConstraints { make in
            make.bottom.equalTo(moreButton.snp.top).offset(-18)
            make.width.equalTo(self.frame.width - 32)
            make.centerX.equalToSuperview()
            make.height.equalTo(65)
        }
    }
    
    func fill(model: PostsViewCellModel){
        postImage.kf.setImage(with: URL(string: model.postImage))
        postTitle.text = model.postTitle
        postSubTitle.text = model.postSubTItle
        
        switch model.postType {
        case .regular:
            moreButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-24)
                make.width.equalTo(self.frame.width - 32)
                make.height.equalTo(50)
                make.centerX.equalToSuperview()
            }
            applyButton.isHidden = true
            moreButton.setTitle("Посмотреть", for: .normal)
            moreButton.setTitleColor(.white, for: .normal)
            moreButton.backgroundColor = UIColor(hexString: "#DB66E4")
        case .event:
            moreButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-24)
                make.width.equalTo(self.frame.width / 2 - 16 - 5)
                make.height.equalTo(50)
                make.leading.equalTo(self.snp.leading).offset(12)
            }
            
            applyButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-24)
                make.width.equalTo(self.frame.width / 2 - 16 - 5)
                make.height.equalTo(50)
                make.trailing.equalTo(self.snp.trailing).offset(-12)
            }
        }
    }
    
}
