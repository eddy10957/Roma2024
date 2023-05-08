//
//  CompetitionsView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct CompetitionsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State var selectedDate = "Ven\n 07/05"
    
    
    //TODO:  showing competition filtered by date , dato che ho messo che non è una data facciamo il controllo se le stringhe sono uguali
    
    var body: some View {
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                VStack (alignment: .leading) {
                    
                    DateSelector(selectedDate: $selectedDate)
                    
                    Text("Favorites")
                        .font(.headline)
                    
                    ForEach(viewModel.competitions.filter({viewModel.favoritesDisciplines.contains($0.discipline)}).filter({$0.date == selectedDate
                    }).sorted(by: {$0.discipline.rawValue < $1.discipline.rawValue}), id: \.self){ competition in
                        DisclosureGroup(content: {
                            ForEach(viewModel.matches, id: \.self) { match in
                                MatchCell(name: match.name, time: match.time, destination: CompetitionsByDisciplineView(competition: competition))
                                    .padding(.vertical, 5)
                            }
                        }, label: {
                            CompetitionCell(competition: competition)
                        })
//                        NavigationLink {
//                            CompetitionsByDisciplineView(competition: competition)
//                        } label: {
//                            CompetitionCell(competition: competition)
//                        }
//                        .padding(.vertical, 5)
                    }
                    
                    
                    Text("All")
                        .font(.headline)
                    
                    ForEach(viewModel.competitions.filter({!viewModel.favoritesDisciplines.contains($0.discipline)}).filter({$0.date == selectedDate
                    }).sorted(by: {$0.discipline.rawValue < $1.discipline.rawValue}), id: \.self){ competition in
                        DisclosureGroup(content: {
                            ForEach(viewModel.matches, id: \.self) { match in
                                MatchCell(name: match.name, time: match.time, destination: CompetitionsByDisciplineView(competition: competition))
                                    .padding(.vertical, 5)
                            }
                        }, label: {
                            CompetitionCell(competition: competition)
                        })

                    }
                }
            }
            .padding()
            .tint(Color.primaryBackground)
        }
    }
}

struct MatchCell<Destination: View>: View {
    var name: String
    var time: String
    var destination: Destination
    var body: some View {
        NavigationLink(destination: destination, label: {
            HStack {
                Spacer()
                    .frame(maxWidth: 20)
                Image(systemName: "medal.fill")
                    .foregroundColor(.primaryBackground)
                Text(name)
                    .font(.footnote)
                Spacer()
                Text(time)
                    .font(.footnote)
            }
        })
    }
}

//struct CompetitionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompetitionsView()
//    }
//}
