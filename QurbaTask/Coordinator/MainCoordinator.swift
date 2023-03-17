//
//  MainCoordinator.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 14/03/2023.
//

import SwiftUI

class MainCoordinator: ObservableObject {
    
    @Published var selectedTab: Tab = .home
    
    enum Tab {
        case home, shop, discount, gallery, profile
    }
    
    func view(for tab: Tab) -> AnyView {
        switch tab {
        case .home:
            return AnyView(HomePageView())
        case .shop:
            return AnyView(HomePageView())
        case .discount:
            return AnyView(HomePageView())
        case .gallery:
            return AnyView(HomePageView())
        case .profile:
            return AnyView(HomePageView())
        }
    }
    

    
}
