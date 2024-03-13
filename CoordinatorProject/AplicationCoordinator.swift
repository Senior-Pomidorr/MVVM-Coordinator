//
//  AplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import UIKit
import SwiftUI
import Combine

final class AplicationCoordinator: Coordinator {
    
    var window: UIWindow
    var childCoordinator = [Coordinator]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var cancellable = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        setupOnboardingValue()
        
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
                if hasSeen {
                    let mainCoordinator = MainCoordinator()
                    mainCoordinator.start()
                    self?.childCoordinator = [mainCoordinator]
                    self?.window.rootViewController = mainCoordinator.rootViewController
                } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                    let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                    onboardingCoordinator.start()
                    self?.childCoordinator = [onboardingCoordinator]
                    self?.window.rootViewController = onboardingCoordinator.rootViewController
                }
            }
            .store(in: &cancellable)
    }
    
    func setupOnboardingValue() {
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter{ $0 == true }
            .sink { value in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &cancellable)
    }
}
