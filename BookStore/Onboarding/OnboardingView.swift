//
//  SwiftUIView.swift
//  BookStore
//
//  Created by George Predan on 20.11.2022.
//

import SwiftUI

struct Onboarding {
    
    struct ContentView: View {

        @State var pageNumber: Int = 1
        let model = Model()
        let nextOnboardingAction: () -> Void
        
        init(nextOnboardingAction: @escaping () -> Void) {
            self.nextOnboardingAction = nextOnboardingAction
            Session.didInstallApp = true
        }
        
        var body: some View {
            Color.init(red: .random(in: (0...1)), green: .random(in: (0...1)), blue: .random(in: (0...1)))
                .onTapGesture {
                    nextOnboardingAction()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding.ContentView(nextOnboardingAction: {})
    }
}


