//
//  HomeView.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 15/03/2023.
//

import SwiftUI

struct HomePageView: View {
    
    @ObservedObject var viewModel = HomePageViewModel()
    @ObservedObject var nm = NetworkManager()
    @State var records: [PostData] = [] // holds the data regarding the Posts retrieved from api
    @State var userRecords: [UserData] = [] // olds the data regarding the Posts retrieved from api
    weak var coordinator: MainCoordinator?
    @State private var isDataFetched = false

    
    
    var body: some View {
        VStack{
            AppHeaderView()
            Divider()
            Spacer()

            // load the homescreen if the posts content are fetched from network
            if isDataFetched {
                List(records) { record in
                    
                    PostView(image: viewModel.profileList[Int.random(in: 0..<6)], caption: record.title, post: viewModel.postPicsList[Int.random(in: 0..<3)], username: "Username", viewModel: viewModel)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .listStyle(GroupedListStyle())
                Spacer()
            }
        }.onAppear{
            nm.fetchAllPosts { posts in
                    records = posts
                }
            nm.fetchAllUsers { users in
                self.userRecords = users
                isDataFetched = true
                print(userRecords[2].firstName)
            }
            
        }
        .overlay(
            ZStack {
                if viewModel.showImageViewer {
                    ImageView(viewModel: viewModel)
                }
            }
        )
    }
}
    
    struct AppHeaderView: View {
        // This structs contains the header of the app, the logo and search button
        @State var moveToNextScreen: Int? = nil
        
        var body: some View {
            HStack(alignment: .center){
                HStack(spacing: 254){
                    Image("LOGO")
                    NavigationLink(destination: SearchView(viewModel: SearchPageViewModel()), tag: 1, selection: $moveToNextScreen) {
                        Button(action: {
                            print("Search Button Pressed")
                            moveToNextScreen = 1
                        }){
                            Image("searchLogo")
                        }
                    }
                }
                .frame(width: 375, height: 44)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
    
/* Post View are divided into 3 parts
 1. PostHeaderView
    A. Views the userimage, username & time posted
 2. PostContent
        A. Views the contents of the posts, the text and the picture
 3. PostView
        A. stacks up both PostHeaderView & PostContent on top of each, and is used to populate the list in the Main View

 */
    struct PostHeaderView: View {
        let imageName: String
        var userName = ""
        var body: some View {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(50)
                VStack{
                    Text(userName)
                        .font(Font.custom("SF Pro Text", size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.11, green: 0.16, blue: 0.22))
                        .padding(.vertical, 2)
                    Text("Time Posted")
                        .font(Font.custom("SF Pro Text", size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.11, green: 0.16, blue: 0.22))
                }
                .padding(.horizontal, 4)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
    }
    
    struct PostContent: View {
        var viewModel : HomePageViewModel?
        
        var caption = ""
        var postPic = ""
        
     
        var body: some View {
            VStack(alignment: .leading) {
                Text(caption)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .font(.footnote)
                
                Button (action: {
                    withAnimation(.easeInOut){
                        viewModel?.selectedImageID = postPic
                        viewModel!.showImageViewer.toggle()
                    }
                }, label: {
                    Image(postPic)
                        .resizable()
                        .frame(width: 343, height: 178)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                    
                })
            }
        }
    }
    
    struct PostView: View {
        var image = ""
        var caption = ""
        var post = ""
        var username = ""
        var viewModel : HomePageViewModel?
        var body: some View {
            VStack {
                PostHeaderView(imageName: image, userName: username)
                PostContent(viewModel: viewModel, caption: caption, postPic: post)
                //            Divider()
            }
        }
        
    }
    
    struct HomePageView_Previews: PreviewProvider {
        static var previews: some View {
            HomePageView()
        }
    }

