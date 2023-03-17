//
//  LoginCoordinator.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 14/03/2023.
//

import SwiftUI

class LoginCoordinator: ObservableObject {
    @Published var isActive = false
    
    func loginSuccessful() {
        isActive = false
    }
    
    func showMainScreen() -> MainView {
        MainView(coordinator: MainCoordinator())
    }
}
