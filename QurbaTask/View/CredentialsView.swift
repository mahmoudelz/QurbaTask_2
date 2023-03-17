//
//  CredentialsView.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 14/03/2023.
//

import SwiftUI

// This is the class is integrated inside LoginView, it only views the main picture and the welcome text

struct CredentialsView: View {
    @State private var keyboardHeight: CGFloat = 0
    @State var value: CGFloat = 0
    
    let networkManager = NetworkManager()
    let coordinator = LoginCoordinator()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("three-girl-friends-having-pizza-bar 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                Text("Welcome")
                    .font(Font.custom("SF Pro Display", size: 20))
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.82))
                
                LoginView(viewModel: LoginViewModel.init(networkManager: networkManager, coordinator: LoginCoordinator()), coordinator: coordinator)
                
            }
        }
    }
}

struct CredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsView()
    }
}

