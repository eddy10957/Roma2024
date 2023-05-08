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
            
            ScrollView {
                
                VStack (alignment: .leading) {
                    
                    DateSelector(selectedDate: $selectedDate)
                    
                    Text("Favorites")
                        .font(.headline)
                    
                    ForEach(viewModel.competitions.filter({viewModel.favoritesDisciplines.contains($0.discipline)}).filter({$0.date == selectedDate
                    }).sorted(by: {$0.discipline.rawValue < $1.discipline.rawValue}), id: \.self){ competition in
                        NavigationLink {
                            CompetitionsByDisciplineView(competition: competition)
                        } label: {
                            CompetitionCell(competition: competition)
                        }
                        .padding(.vertical, 5)
                    }
                    
                    
                    Text("All")
                        .font(.headline)
                    
                    ForEach(viewModel.competitions.filter({!viewModel.favoritesDisciplines.contains($0.discipline)}).filter({$0.date == selectedDate
                    }).sorted(by: {$0.discipline.rawValue < $1.discipline.rawValue}), id: \.self){ competition in
                        NavigationLink {
                            CompetitionsByDisciplineView(competition: competition)
                        } label: {
                            CompetitionCell(competition: competition)
                            
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .padding()
            .tint(Color.primaryBackground)
        }
    }
}

//struct CompetitionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompetitionsView()
//    }
//}
