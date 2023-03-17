//
//  Post.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 12/03/2023.
//

import Foundation

// This struct handle the Post Data recieved from the API
struct PostResults: Decodable {
    let posts: [PostData]
}

struct PostData: Decodable, Identifiable {
    var postID: Int {
        return id
    }
    var id: Int
    var title: String
    var body: String
    var userId: Int
}
