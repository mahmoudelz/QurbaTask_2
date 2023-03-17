//
//  SearchViewModel.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 15/03/2023.
//

import SwiftUI


class SearchPageViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var records: [PostData] = []
    
    private let networkManager = NetworkManager()
    
    func searchPosts() {
        networkManager.searchPosts(searchString: searchText) { posts in
            DispatchQueue.main.async {
                self.records = posts
            }
        }
    }
}
