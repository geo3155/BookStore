//
//  SplashScreen.swift
//  BookStore
//
//  Created by George Predan on 04.11.2022.
//

import UIKit
import SwiftUI

struct SplashScreen: View {
    
    var body: some View {
        Color.neonBlue.ignoresSafeArea()
    }
}

class SplashScreenViewController: UIHostingController<SplashScreen> {
    
    init() {
        super.init(rootView: SplashScreen())
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
