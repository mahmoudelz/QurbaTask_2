//
//  SearchCoordinator.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 15/03/2023.
//

import SwiftUI

class SearchCoordinator:  MainCoordinator {
    
    var navigationController: UINavigationController
       
       init(navigationController: UINavigationController) {
           self.navigationController = navigationController
       }
      
    func start() {
         let viewModel = SearchPageViewModel()
         var view = SearchView(viewModel: viewModel)
         view.coordinator = self
         navigationController.pushViewController(UIHostingController(rootView: view), animated: true)
     }
    
}
