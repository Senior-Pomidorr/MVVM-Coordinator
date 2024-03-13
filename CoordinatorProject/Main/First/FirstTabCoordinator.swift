//
//  FirstTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import UIKit
import SwiftUI

final class FirstTabCoordinator: Coordinator {
    
    let rootViewController: UINavigationController
    let viewModel = FirstTabViewModel()
    
    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.showDetailRequest = { [weak self] in
            self?.goToDetail()
        }
        vc.title = "First"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func goToDetail() {
        let detailVC = UIHostingController(rootView: FirstDetailVIew(vm: viewModel))
        rootViewController.pushViewController(detailVC, animated: true)
    }
}
