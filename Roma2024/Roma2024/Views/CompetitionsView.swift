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
            ZStack {
                
                ScrollView{
                    DateSelector(selectedDate: $selectedDate)
                    Text("Favorites")
                        .font(.title)
                    
                    ForEach(viewModel.competitions.filter({viewModel.favoritesDisciplines.contains($0.discipline)}).filter({$0.date == selectedDate
                    }).sorted(by: {$0.discipline.rawValue < $1.discipline.rawValue}), id: \.self){ competition in
                        NavigationLink {
                            CompetitionsByDisciplineView(competition: competition)
                        } label: {
                            CompetitionCell(competition: competition)
                        }
                        .padding()
                    }
                    
                    
                    Text("All")
                        .font(.title)
                    
                    ForEach(viewModel.competitions.filter({!viewModel.favoritesDisciplines.contains($0.discipline)}).filter({$0.date == selectedDate
                    }).sorted(by: {$0.discipline.rawValue < $1.discipline.rawValue}), id: \.self){ competition in
                        NavigationLink {
                            CompetitionsByDisciplineView(competition: competition)
                        } label: {
                            CompetitionCell(competition: competition)
                                
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

//struct CompetitionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompetitionsView()
//    }
//}
