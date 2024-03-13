//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import Foundation
import SwiftUI

final class OnboardingCoordinator: Coordinator {
    
    var rootViewController = UIViewController()
    
    func start() {
        
        let view = OnboardingView {
            
        }
        
        rootViewController = UIHostingController(rootView: view)
    }
}
