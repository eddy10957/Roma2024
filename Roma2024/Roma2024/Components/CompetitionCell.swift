//
//  DisciplineCell.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 07/05/23.
//

import SwiftUI

struct CompetitionCell: View {
    @EnvironmentObject var viewModel :ViewModel
    @State var competition : Competitions
    var body: some View {
        HStack{
            Image(systemName: viewModel.favoritesDisciplines.contains(competition.discipline) ? "star.fill" : "star")
                .onTapGesture {
                    if viewModel.favoritesDisciplines.contains(competition.discipline) {
                        guard let index = viewModel.favoritesDisciplines.firstIndex(where: {$0 == competition.discipline}) else {return}
                        viewModel.favoritesDisciplines.remove(at: index)
                    } else{
                        viewModel.favoritesDisciplines.append(competition.discipline)
                    }
                }
            
            Text(competition.discipline.rawValue)
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
    }
}

//struct DisciplineCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CompetitionCell()
//    }
//}
