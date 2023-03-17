//
//  LoginViewModel.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 14/03/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var didLoginSucceed = false
    
    private let networkManager: NetworkManager
    private let coordinator: LoginCoordinator
    
    init(networkManager: NetworkManager, coordinator: LoginCoordinator) {
        self.networkManager = networkManager
        self.coordinator = coordinator
    }
    
    func login() {
        let isAuth = networkManager.login(username: username, password: password)
        if isAuth {
            didLoginSucceed = true
            coordinator.loginSuccessful()
        }
    }
}
