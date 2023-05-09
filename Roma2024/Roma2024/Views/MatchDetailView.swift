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
        
        VStack {
            ScrollView {
                HStack {
                    VStack(spacing: 0) {
                    Text(competition.date.suffix(5) + " \(match.time)")
                        HStack {
                            Image("stadium")
                            Text("Stadio Olimpico")
                        }
                        .foregroundColor(.primaryBackground)
                        .padding()
                    }
                }
                VStack(alignment: .leading) {
                    ForEach(Array(match.athletes.enumerated()), id: \.offset) { index, athlete in
                        HStack {
                            // MARK: Athlete position
                            Text("\(index.advanced(by: 1)).")
                                .font(.footnote)
                            
                            // MARK: Medals
                                if athlete == match.athletes[0] {
                                    Image("goldMedal")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                if athlete == match.athletes[1] {
                                    Image("silverMedal")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                if athlete == match.athletes[2] {
                                    Image("bronzeMedal")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                AthletesElement(img: athlete.image, name: athlete.name, surname: athlete.surname)
                            
                            }
                        .background {
                            if athlete == match.athletes[0] {
                                Color.yellow
                                    .opacity(0.1)
                                    .ignoresSafeArea()
                            }
                            if athlete == match.athletes[1] {
                                Color.secondary
                                    .opacity(0.1)
                                    .ignoresSafeArea()
                            }
                            if athlete == match.athletes[2] {
                                Color.brown
                                    .opacity(0.1)
                                    .ignoresSafeArea()
                            }
                        }
                        }
                    }
//                    Image(competition.discipline.rawValue.lowercased())
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150)
                    Spacer()
                
            }
            .navigationTitle(Text(match.name))
        }
        .padding()
    }
}

struct AthletesElement: View {
    var img: String
    var name: String
    var surname: String
    var body: some View {
        HStack {
            Image(img)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.light)
                Text(surname)
                    .font(.headline)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Time")
                    .font(.footnote)
                Text("10:09:65")
            }
        }
    }
}

//struct MatchDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchDetailView()
//    }
//}
