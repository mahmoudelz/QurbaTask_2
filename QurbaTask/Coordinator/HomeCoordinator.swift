//
//  HomeCoordinator.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 15/03/2023.
//

import SwiftUI

import SwiftUI

class HomeCoordinator: MainCoordinator {
    var childCoordinators = [MainCoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomePageViewModel()
        var homeView = HomePageView(viewModel: viewModel)
        homeView.coordinator = self
        navigationController.pushViewController(UIHostingController(rootView: homeView), animated: false)
    }
    
    func navigateToSearch() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        childCoordinators.append(searchCoordinator)
        searchCoordinator.start()
    }
}
