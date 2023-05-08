//
//  MatchDetailView.swift
//  Roma2024
//
//  Created by Raffaele Siciliano on 08/05/23.
//

import SwiftUI

struct MatchDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var match : Match
    @State var competition : Competitions
    var body: some View {
        
        ScrollView {
            Text(competition.date.suffix(5) + " \(match.time)")
            Text(match.name)
            Image(competition.discipline.rawValue.lowercased())
                .resizable()
                .scaledToFit()
                .frame(width: 150)
        }
    }
}

//struct MatchDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchDetailView()
//    }
//}
