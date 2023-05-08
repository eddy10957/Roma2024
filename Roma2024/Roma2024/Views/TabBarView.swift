//
//  ContentView.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 05/05/23.
//

import SwiftUI

struct TabBarView: View {
    @State var showProfile = false
    @State var showTickets = false
    var body: some View {
        TabView {
            DiscoverView()
                .tabItem({
                    TabItem(icon: "europeanAthletics.small", title: "Discover")
                })
            CompetitionsView()
                .tabItem({
                    TabItem(icon: "sprint.small", title: "Competitions")
                })
            MapView()
                .tabItem({
                    TabItem(icon: "stadium", title: "Village")
                })
        }
        .tint(.hyperAccent)
        .overlay(alignment: .topTrailing) {
            FloatingMenu(showProfile: $showProfile, showTickets: $showTickets)
        }
        .fullScreenCover(isPresented: $showProfile){
            ProfileView()
        }
        .fullScreenCover(isPresented: $showTickets){
            TicketsView()
        }
    }
}

struct TabItem: View {
    var icon: String
    var title: String
    var body: some View {
        VStack {
            Image(icon)
                .renderingMode(.template)
            Text(title)
                .font(.largeTitle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
