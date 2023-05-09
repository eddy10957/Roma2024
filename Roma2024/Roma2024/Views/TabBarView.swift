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
    @State var showRedeems = false
    var body: some View {
        TabView {
            DiscoverView()
                .overlay(alignment: .topTrailing) {
                    FloatingMenu(showProfile: $showProfile, showTickets: $showTickets, showRedeems: $showRedeems)
                }
                .tabItem({
                    TabItem(icon: "europeanAthletics.small", title: "Discover")
                })
            CompetitionsView()
                .overlay(alignment: .topTrailing) {
                    FloatingMenu(showProfile: $showProfile, showTickets: $showTickets, showRedeems: $showRedeems)
                }
                .tabItem({
                    TabItem(icon: "sprint.small", title: "Competitions")
                })
            MapView()
                .tabItem({
                    TabItem(icon: "stadium", title: "Village")
                })
        }
        .tint(.hyperAccent)
        .fullScreenCover(isPresented: $showProfile){
            ProfileView()
        }
        .fullScreenCover(isPresented: $showTickets){
            TicketsView()
        }
        .fullScreenCover(isPresented: $showRedeems){
            RedeemsView()
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
