//
//  MainVC.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    let rootViewController: UITabBarController
    var childCoordinator = [Coordinator]()
    
    init() {
        rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .white
    }
    
    func start() {
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        
        let firstVC = firstCoordinator.rootViewController
        firstVC.tabBarItem = .init(title: "First VC", image: UIImage(systemName: "paperplane"), selectedImage: UIImage(systemName: "paperplane.fill"))
        
        let secondVC = secondCoordinator.rootViewController
        secondVC.tabBarItem = .init(title: "Second VC", image: UIImage(systemName: "bell"), selectedImage: UIImage(systemName: "bell.fill"))
        
        self.childCoordinator.append(firstCoordinator)
        self.childCoordinator.append(secondCoordinator)
        
        self.rootViewController.viewControllers = [firstVC, secondVC]
    }
}
