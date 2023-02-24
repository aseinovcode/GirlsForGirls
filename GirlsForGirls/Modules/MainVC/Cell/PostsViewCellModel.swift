//
//  PostsViewCellModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 24.02.2023.
//

import Foundation

class PostsViewCellModel {
    
    var postImage: String
    var postTitle: String
    var postSubTItle: String
    
    init(postImage: String,postTitle: String,postSubTItle: String){
        self.postImage = postImage
        self.postTitle = postTitle
        self.postSubTItle = postSubTItle
    }
}
