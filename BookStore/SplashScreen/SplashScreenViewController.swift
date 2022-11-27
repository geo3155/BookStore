//
//  SplashScreenViewController.swift
//  BookStore
//
//  Created by George Predan on 15.11.2022.
//

import Foundation
import UIKit
import SwiftUI

extension SplashScreen {
    
    class ViewController: UIHostingController<ContentView> {

        init(action: @escaping () -> Void) {
            super.init(rootView: ContentView(nextCoordinatorAction: action))
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
