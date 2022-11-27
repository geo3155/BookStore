//
//  HomeView.swift
//  BookStore
//
//  Created by George Predan on 16.11.2022.
//

import SwiftUI

struct Home {
    struct ContentView: View {
        var body: some View {
            ZStack {
                Color.blue
            }.background(Color.green.ignoresSafeArea())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home.ContentView()
    }
}
