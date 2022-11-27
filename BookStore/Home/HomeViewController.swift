//
//  HomeViewController.swift
//  BookStore
//
//  Created by George Predan on 16.11.2022.
//

import Foundation
import UIKit
import SwiftUI

extension Home {
    class ViewController: UIHostingController<ContentView> {
        
        init() {
            super.init(rootView: ContentView())
            title = "Home"
            tabBarItem.selectedImage = UIImage(systemName: "pencil")
            tabBarItem.image = UIImage(systemName: "pencil")
        }
        
        @MainActor required dynamic init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
