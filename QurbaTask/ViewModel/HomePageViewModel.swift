//
//  HomeViewModel.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 15/03/2023.
//

import SwiftUI
import Foundation

class HomePageViewModel: ObservableObject {
    
    @Published var posts = [PostData]()
    private let networkManager = NetworkManager()
    var records: [PostData] = []
    var allUsers: [UserData] = []
    let postPicsList = ["postPic1", "postPic2", "postPic3"]
    let profileList = ["profile1", "profile2", "profile3","profile4","profile5","profile6"]
    @Published var selectedImage : [String] = []
    @Published var selectedImageID : String = ""
    @Published var showImageViewer = false
    

    func fetchAllPosts() {
           
        networkManager.fetchAllPosts { posts in
               DispatchQueue.main.async {
                   self.records = posts
                   print("---- Home Page Records ----")
                   print(self.records[0].title)
               }
           }
        
        
       }
}


