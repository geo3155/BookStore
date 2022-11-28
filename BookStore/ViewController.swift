//
//  ViewController.swift
//  BookStore
//
//  Created by George Predan on 26.10.2022.
//

import UIKit
import SwiftUI

extension SplashScreen {
    
    class ViewController: UIHostingController<ContentView> {
        
        init() {
            super.init(rootView: ContentView())
        }
        
        @MainActor required dynamic init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

