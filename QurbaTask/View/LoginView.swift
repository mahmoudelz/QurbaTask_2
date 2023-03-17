//
//  LoginView.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 14/03/2023.
//

import SwiftUI

// This struct creates a custome secure field for the password textfield
struct SecureTextField: View {
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {

        HStack{
            if isSecureField {
                SecureField("Enter Your Password", text: $text)
            } else {
                TextField(text, text: $text)
            }
        }.overlay(alignment: .trailing) {
            Image(systemName: isSecureField ? "eye.slash" : "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var coordinator: LoginCoordinator
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 6) {
                Text("User Name")
                    .font(Font.custom("SF Pro Text", size: 15))
                    .fontWeight(.regular)
                TextField("Enter Your Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:343, height: 42)
                    .cornerRadius(1)
            }
            .padding([.vertical], 24)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Password")
                    .font(Font.custom("SF Pro Text", size: 15))
                
                SecureTextField(text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:343, height: 42)
                    .cornerRadius(1)
            }
            
            NavigationLink(
                destination: coordinator.showMainScreen(),
                isActive: $viewModel.didLoginSucceed
            ) {
                Button(action: viewModel.login) {
                    Text("Sign In")
                        .font(Font.custom("SF Pro Text", size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(width:343, height:46)
                .background(Color(red: 0.25, green: 0.25, blue: 0.82))
                .cornerRadius(32)
                .padding([.vertical], 24)
            }
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
