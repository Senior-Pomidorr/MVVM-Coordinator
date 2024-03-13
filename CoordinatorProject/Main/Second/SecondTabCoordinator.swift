//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import UIKit

final class SecondTabCoordinator: Coordinator {
    
    let rootViewController = UINavigationController()
    lazy var secondVC: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    
    
    func start() {
        rootViewController.setViewControllers([secondVC], animated: false)
    }
}
