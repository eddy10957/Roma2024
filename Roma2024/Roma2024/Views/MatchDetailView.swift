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
    var body: some View {
        
        ScrollView {
            Text(match.name)
        }
    }
}

//struct MatchDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchDetailView()
//    }
//}
