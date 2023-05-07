//
//  Roma2024App.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 05/05/23.
//

import SwiftUI

@main
struct Roma2024App: App {
    @State var showSplashScreen = true
    @StateObject var viewModel : ViewModel = ViewModel.shared
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplashScreen {
                    SplashView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                                showSplashScreen = false
                            }
                        }
                } else {
                    TabBarView()
                        .environmentObject(viewModel)
                }
            }
            .animation(.easeInOut(duration: 0.35), value: showSplashScreen)
        }
    }
}
