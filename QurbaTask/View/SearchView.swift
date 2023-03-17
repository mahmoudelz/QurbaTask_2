//
//  SearchPageView.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 15/03/2023.
//

import SwiftUI


struct SearchView: View {
    @ObservedObject var viewModel: SearchPageViewModel
    weak var coordinator: MainCoordinator?
    
    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.searchText, onSearchTapped: viewModel.searchPosts)
            
            Divider()
            if viewModel.records.isEmpty {
                Spacer()
                Text("No results found.")
                Spacer()
            } else {
                List(viewModel.records) { record in
                    PostView(image: HomePageViewModel().profileList[Int.random(in: 0..<6)], caption: record.body, post: HomePageViewModel().postPicsList[Int.random(in: 0..<3)])
                }
                .listStyle(GroupedListStyle())
            }
        }
        .font(Font.custom("SF Pro Text", size: 17))
        
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchPageViewModel()
        SearchView(viewModel: viewModel)
    }
}

// This struct create a custome searchBar for the view
struct SearchBar: View {
    @Binding var searchText: String
    let onSearchTapped: () -> Void
    
    var body: some View {
        HStack {
            Image("searchLogo")
                .padding(.horizontal, 16)
                .onTapGesture {
                    onSearchTapped()
                }
            TextField("Search Posts", text: $searchText)
                .padding(5)
                .overlay(
                    Image("close-circle")
                        .padding(.horizontal, 16)
                        .onTapGesture {
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }.overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 0.82, green: 0.84, blue: 0.87), lineWidth: 2)
                .frame(width: 343, height: 48)
        )
    }
}
