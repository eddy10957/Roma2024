//
//  ContentView.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 05/05/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            DiscoverView()
                .tabItem({
                    Image(systemName: "circle.fill")
                })
            CompetitionsView()
                .tabItem({
                    Image(systemName: "circle.fill")
                })
            MapView()
                .tabItem({
                    Image(systemName: "circle.fill")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
