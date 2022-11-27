//
//  RootCoordinator.swift
//  BookStore
//
//  Created by George Predan on 15.11.2022.
//

import Foundation
import UIKit
import SwiftUI

protocol Coordinator {
    
    var window: UIWindow { get set }
    func start()
}

class RootCoordinator: Coordinator {
    
    var window: UIWindow
    var mainCoordinator: MainCoordinator?
    var onboardingCoordinator: OnboardingCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let splashScreenVC = SplashScreen.ContentView {
            UIView.transition(with: self.window, duration: 0.3, options: .transitionCrossDissolve) {
                if Session.didInstallApp {
                    self.showMainCoordinator()
                } else {
                    self.showOnboardingCoordinator()
                }
            }
        }
        window.makeKeyAndVisible()
        self.window.rootViewController = UIHostingController(rootView: splashScreenVC)
    }
    
    func showMainCoordinator() {
        mainCoordinator = .init(window: window)
        mainCoordinator?.start()
        onboardingCoordinator = nil
    }
    
    func showOnboardingCoordinator() {
        mainCoordinator = nil
        onboardingCoordinator = .init(window: window, onFinishedInteraction: {
            self.showMainCoordinator()
        })
        onboardingCoordinator?.start()
    }
}

class MainCoordinator: Coordinator {
    
    var window: UIWindow
    let tabbarController = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let homeVC = Home.ViewController()
        let simpleVC = UIHostingController(rootView: Color.red)
        
        tabbarController.setViewControllers([homeVC, simpleVC], animated: false)
        UIView.transition(with: self.window, duration: 0.3, options: .transitionCrossDissolve) {
            self.window.rootViewController = self.tabbarController
        }
    }
}

class OnboardingCoordinator: Coordinator {
    
    var window: UIWindow
    let navigationController = UINavigationController()
    let onFinishedInteraction: () -> Void
    
    init(window: UIWindow, onFinishedInteraction: @escaping () -> Void) {
        self.window = window
        self.onFinishedInteraction = onFinishedInteraction
    }
    
    func start() {
        let onboardingVC = Onboarding.ViewController {
            self.showScreen1()
        }
        navigationController.setViewControllers([onboardingVC], animated: false)
        UIView.transition(with: self.window, duration: 0.3, options: .transitionCrossDissolve) {
            self.window.rootViewController = self.navigationController
        }
    }
    
    func showScreen1() {
        let onboardingVC = Onboarding.ViewController { [weak self] in
            self?.showScreen2()
        }
        navigationController.pushViewController(onboardingVC, animated: false)
    }
    
    func showScreen2() {
        let onboardingVC = Onboarding.ViewController { [weak self] in
            self?.onFinishedInteraction()
        }
        navigationController.pushViewController(onboardingVC, animated: false)
    }
}
