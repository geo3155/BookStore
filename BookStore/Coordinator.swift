//
//  Coordinator.swift
//  BookStore
//
//  Created by George Predan on 06.11.2022.
//

import UIKit
import SwiftUI

enum AppScreen {
    
    case mainFlow
}

struct Coordinator: View {
    
    @State var screens: [AppScreen] = [.mainFlow]
    
    var body: some View {
        NavigationView {
            NavigationStack(path: $screens) {
                Color.green
            }
        }
    }
    
    private func popToRoot() {
        screens = [.mainFlow]
    }
    
    private func popScreen() {
        screens = screens.dropLast(1)
    }
}
