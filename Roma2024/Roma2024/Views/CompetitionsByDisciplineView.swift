//
//  CompetitionsByDisciplineView.swift
//  Roma2024
//
//  Created by Raffaele Siciliano on 08/05/23.
//

import SwiftUI

struct CompetitionsByDisciplineView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State var competition : Competitions

    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Text("Today " + (competition.date.suffix(5)))
                Spacer()
            }
            .padding(.horizontal)
            HStack {
                Text(competition.discipline.rawValue)
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal)
            
            if competition.matches.isEmpty == false {
                ForEach(competition.matches, id: \.self) { match in
                    NavigationLink {
                        MatchDetailView(match: match)
                    } label: {
                        HStack {
                            Image(competition.discipline.rawValue.lowercased())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                            Text(match.name)
                            Spacer()
                            Text(match.time)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            
        }
        Spacer()
    }
}

//struct CompetitionsByDisciplineView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompetitionsByDisciplineView()
//    }
//}
