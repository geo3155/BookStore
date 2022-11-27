//
//  OnboardingViewController.swift
//  BookStore
//
//  Created by George Predan on 20.11.2022.
//

import Foundation
import SwiftUI
import UIKit

extension Onboarding {
    class ViewController: UIHostingController<ContentView> {
        
        init(nextOnboardingAction: @escaping () -> Void) {
            super.init(rootView: ContentView(nextOnboardingAction: nextOnboardingAction))
        }
        
        @MainActor required dynamic init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
