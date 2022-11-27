//
//  SplashScreen.swift
//  BookStore
//
//  Created by George Predan on 15.11.2022.
//

import SwiftUI

struct SplashScreen {
    
    struct ContentView: View {
        
        @State private var scaleEffect: CGFloat = 1.0
        let nextCoordinatorAction: () -> Void
        
        var body: some View {
            VStack(spacing: 30) {
                
                Circle()
                    .fill(.orange)
                    .frame(width: 100, height: 100)
                    .scaleEffect(scaleEffect)
                    .animation(.linear(duration: 1).repeatCount(3), value: scaleEffect)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.brown)
            .task {
                scaleEffect = 1.5
                try? await Task.sleep(nanoseconds: 3_500_000_000)
                nextCoordinatorAction()
            }
//            .onAppear {
//                scaleEffect = 1.5
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5, execute: nextCoordinatorAction)
//            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen.ContentView(nextCoordinatorAction: {})
    }
}
