//
//  AplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import UIKit
import SwiftUI

final class AplicationCoordinator: Coordinator {
    
    var window: UIWindow
    var childCoordinator = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
//        let onboardingCoordinator = OnboardingCoordinator()
//        onboardingCoordinator.start()
//        self.childCoordinator = [onboardingCoordinator]
//        window.rootViewController = onboardingCoordinator.rootViewController
        
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.childCoordinator = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
    
    
}
