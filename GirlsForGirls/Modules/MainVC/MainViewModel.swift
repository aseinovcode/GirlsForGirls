//
//  MainViewModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 17.03.2023.
//

import Foundation

class MainViewModel {
    
    var posts = [PostsViewCellModel]()
    
    func addPosts(){
        posts.append(PostsViewCellModel(postImage: "https://www.womensissuescentre.com/wp-content/uploads/2020/09/Women_workplace.jpg", postTitle: "Girls for Girls", postSubTItle: "Girls for Girls support us", postType: .regular))
        posts.append(PostsViewCellModel(postImage: "https://www.womensissuescentre.com/wp-content/uploads/2020/09/Women_workplace.jpg", postTitle: "Girls for Girls", postSubTItle: "Girls for Girls support us", postType: .event))
//        posts.append(PostsViewCellModel(postImage: "https://www.womensissuescentre.com/wp-content/uploads/2020/09/Women_workplace.jpg", postTitle: "Girls for Girls", postSubTItle: "Girls for Girls support us", postType: .regular))
//        posts.append(PostsViewCellModel(postImage: "https://www.womensissuescentre.com/wp-content/uploads/2020/09/Women_workplace.jpg", postTitle: "Girls for Girls", postSubTItle: "Girls for Girls support us", postType: .event))
    }
    
    
}
