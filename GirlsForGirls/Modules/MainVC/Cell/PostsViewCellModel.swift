//
//  PostsViewCellModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 24.02.2023.
//

import Foundation

enum PostType {
    case regular
    case event
}

class PostsViewCellModel {
    
    
    var postImage: String
    var postTitle: String
    var postSubTItle: String
    var postType: PostType
    
    init(postImage: String,postTitle: String,postSubTItle: String, postType: PostType){
        self.postImage = postImage
        self.postTitle = postTitle
        self.postSubTItle = postSubTItle
        self.postType = postType
    }
}
