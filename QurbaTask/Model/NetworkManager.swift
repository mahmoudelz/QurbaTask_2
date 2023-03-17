//
//  NetworkManager.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 09/03/2023.
//

import Foundation
import SwiftUI
import Combine
var isAuthorized = false

// This class handles all networking functionality

// ***** ONLY THE LOGIN FUNCTION IS WRITTEN USING COMBINE *****

class NetworkManager: ObservableObject {
    
    @Published var userAuth: String = "kminchelle"
    @Published var passAuth: String = "0lelplR"
    @Published var posts = [PostData]()
    @Published var users = [UserData]()
    
//    var body = ["username": "kminchelle",
//                "password": "0lelplR"]
    
    private let session = URLSession(configuration: .default)
       private var cancellables = Set<AnyCancellable>()
       
       // MARK: - Authenticate Login
       func login(username: String, password: String) -> Bool {
           
           print("Button Pressed")
           
           var jsonBody: [String: String] = [:]
           
           jsonBody["username"] = username
           jsonBody["password"] = password
           
           guard let url = URL(string: "https://dummyjson.com/auth/login") else {
               return false
           }
           
           var request = URLRequest(url: url)
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           let bodyData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
           request.httpMethod = "POST"
           request.httpBody = bodyData
           
           let publisher = session.dataTaskPublisher(for: request)
               .map(\.data)
               .decode(type: UserData.self, decoder: JSONDecoder())
               .receive(on: DispatchQueue.main)
               .sink(receiveCompletion: { result in
                   switch result {
                   case .failure(let error):
                       print("User not found: \(error)")
                   case .finished:
                       isAuthorized = true
                       print("isAuthorized \(isAuthorized)")
                   }
               }, receiveValue: { userDataResult in
                   self.userAuth = userDataResult.username
                   print("------------username----------")
                   print(userDataResult.firstName)
               })
           
           cancellables.insert(publisher)
           
           return isAuthorized
       }
       
       // MARK: - Fetch Posts
    func fetchAllPosts(completion: @escaping ([PostData]) -> ()) {
            
            print("Fetching Posts started")
            if let url = URL(string: "https://dummyjson.com/posts") {
                let request = URLRequest(url: url)
                
                let task = session.dataTask(with: request) { data, response, error in
                    if error == nil {
                        let decoder = JSONDecoder()
                        if let safePostData = data {
                            do {
                                let postDataResult = try decoder.decode(PostResults.self, from: safePostData)
                                DispatchQueue.main.sync {
                                    self.posts = postDataResult.posts
                                    
                                    print("------- Post 1 title inside -------")
                                    print(self.posts[0].title)
                                    

                                }
                                
                            } catch {
                                print("Unable to fetch posts")
                            }
                        }
                    }
                    DispatchQueue.main.sync {
                        completion(self.posts)

                    }
                }
                task.resume()
            }
        }

       
    
    func searchPosts(searchString: String, completion: @escaping ([PostData]) -> ()){
        print("Searching Posts started")
        
        var searchRequest = "https://dummyjson.com/posts/search?q=" + searchString
        
        if let url = URL(string: searchRequest) {
            let request = URLRequest(url: url)
            
            let task = session.dataTask(with: request) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safePostData = data {
                        do {
                            let postDataResult = try decoder.decode(PostResults.self, from: safePostData)
                            DispatchQueue.main.sync {
                                self.posts = postDataResult.posts
                                print("------- Post 1 title inside -------")
                                print(self.posts[0].title)
                                
                            }
                            
                        } catch {
                            print("Unable to search posts")
                        }
                    }
                }
                DispatchQueue.main.sync {
                    completion(self.posts)
                }
            }
            task.resume()
        }
        return
    }
    
    struct ErrorAlert: View {
        @State private var showingAlert = false
        
        var body: some View {
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    func fetchAllUsers(completion: @escaping ([UserData]) -> ()) {
        
        print("Fetching All users started")
        if let url = URL(string: "https://dummyjson.com/user") {
            let request = URLRequest(url: url)
            
            let task = session.dataTask(with: request) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeUsersData = data {
                        do {
                            let usersDataResult = try decoder.decode(UserResults.self, from: safeUsersData)
                            DispatchQueue.main.sync {
                                self.users = usersDataResult.users
                                
                                print("------- user 1 title inside -------")
                                print(self.users[0].firstName)
                            }
                            
                        } catch {
                            print("Unable to fetch users")
                        }
                    }
                }
                DispatchQueue.main.sync {
                    completion(self.users)
                }
            }
            task.resume()
        }
    }
}

