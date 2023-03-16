//
//  MainViewController.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 23.02.2023.
//

import Foundation
import UIKit
import SnapKit

class MainViewController: BaseViewController {
    
    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.fillHeader(title: "Qwe", subTitle: "SubQwer", profileImage: UIImage(named:"shome") ?? UIImage())
        return view
    }()
    
    private lazy var postsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(cellWithClass: PostsCollectionViewCell.self)
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.layer.cornerRadius = min(view.frame.width, view.frame.height) / 9
        return view
    }()
    
    override func setupViews() {
        view.addSubview(headerView)
        view.addSubview(postsCollection)
    }
    
    override func constraints() {
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(60)
            make.width.equalTo(view.frame.width - 32)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
        postsCollection.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func setupValues() {
        addPosts()
    }
    
    var posts = [PostsViewCellModel]()
    
    func addPosts(){
        posts.append(PostsViewCellModel(postImage: "https://www.womensissuescentre.com/wp-content/uploads/2020/09/Women_workplace.jpg", postTitle: "Girls for Girls", postSubTItle: "Girls for Girls support us", postType: .regular))
        posts.append(PostsViewCellModel(postImage: "https://www.womensissuescentre.com/wp-content/uploads/2020/09/Women_workplace.jpg", postTitle: "Girls for Girls", postSubTItle: "Girls for Girls support us", postType: .event))
        posts.append(PostsViewCellModel(postImage: "https://www.womensissuescentre.com/wp-content/uploads/2020/09/Women_workplace.jpg", postTitle: "Girls for Girls", postSubTItle: "Girls for Girls support us", postType: .regular))
        posts.append(PostsViewCellModel(postImage: "https://www.womensissuescentre.com/wp-content/uploads/2020/09/Women_workplace.jpg", postTitle: "Girls for Girls", postSubTItle: "Girls for Girls support us", postType: .event))
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let load = posts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withClass: PostsCollectionViewCell.self, for: indexPath)
        cell.fill(model: load)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 360)
    }
    
}
