//
//  MainView.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 12/03/2023.
//

import SwiftUI

// This struct handle the Tab bar, only the hampage is active, however the buttons are clickable
struct MainView: View {
    
    @StateObject var coordinator = MainCoordinator()
    
    var body: some View {
        
        TabView(selection: $coordinator.selectedTab) {
            
            coordinator.view(for: .home)
                .tabItem {
                    Image("home").renderingMode(.template)
                }
                .tag(MainCoordinator.Tab.home)
            
            coordinator.view(for: .shop)
                .tabItem {
                    Image("shop").renderingMode(.template)
                }
                .tag(MainCoordinator.Tab.shop)
            
            coordinator.view(for: .discount)
                .tabItem {
                    Image("discount-shape").renderingMode(.template)
                }
                .tag(MainCoordinator.Tab.discount)
            
            coordinator.view(for: .gallery)
                .tabItem {
                    Image("gallery").renderingMode(.template)
                }
                .tag(MainCoordinator.Tab.gallery)
            
            coordinator.view(for: .profile)
                .tabItem {
                    Image("profile").renderingMode(.template)
                }
                .tag(MainCoordinator.Tab.profile)
            
        }
        .tint(Color(red: 0.25, green: 0.25, blue: 0.82))
        .environmentObject(coordinator)
    }
}
