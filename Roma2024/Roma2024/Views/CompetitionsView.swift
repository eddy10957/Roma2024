//
//  CompetitionsView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct CompetitionsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var days : [String] = ["Ven\n 07.05","Sab\n 08.05","Dom\n 09.05","Lun\n 10.05","Mar\n 11.05","Mer\n 12.05"]
    
    //TODO:  showing competition filtered by date , dato che ho messo che non è una data facciamo il controllo se le stringhe sono uguali
    
    var body: some View {
        ZStack {
            
            ScrollView{
                HStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            HStack(spacing: 5) {
                                ForEach(days, id: \.self){day in
                                    Text(day)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .padding(16)
                            
                        }
                    }
                    .padding(.trailing,80)
                }
                
                Text("Favorites")
                    .font(.title)
                
                ForEach(viewModel.competitions.filter({viewModel.favoritesDisciplines.contains($0.discipline)}), id: \.self){ competition in
                    CompetitionCell(competition: competition)
                        .padding()
                }
                
                
                Text("All")
                    .font(.title)
                
                // Si vedono delle stelle perché so strunz
                
                ForEach(viewModel.competitions.sorted(by: {$0.discipline.rawValue < $1.discipline.rawValue}), id: \.self){ competition in
                    CompetitionCell(competition: competition)
                        .padding()
                }
            }
        }
    }
}

struct CompetitionsView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionsView()
    }
}
