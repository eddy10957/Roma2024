//
//  MoreFavoritesView.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 09/05/23.
//

import SwiftUI

struct MoreFavoritesView: View {
    @EnvironmentObject var viewModel : ViewModel
    
    @State private var picker = 0
    var body: some View {
        VStack{
            Picker("", selection: $picker) {
                Text("Athlettes").tag(0)
                Text("Nations").tag(1)
                Text("Disciplines").tag(2)
            }
            .pickerStyle(.segmented)
            ScrollView{
                if picker == 0{
                    VStack(alignment: .leading){
                        VStack(alignment:.leading, spacing: 5) {
                            ForEach(viewModel.athletes, id:\.self){ athlete in
                                HStack(){
                                    Image(athlete.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    VStack{
                                        Text(athlete.name)
                                            .foregroundColor(.body)
                                        Text(athlete.surname)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Image(athlete.country.lowercased())
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                }
                            }
                        }
                        .padding(16)
                    }
                    
                }else if picker == 1{
                    VStack{
                        VStack(alignment:.leading, spacing: 5) {
                            ForEach(viewModel.athletes, id:\.self){ athlete in
                                HStack{
                                    Image(athlete.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    VStack{
                                        Text(athlete.name)
                                            .foregroundColor(.body)
                                        Text(athlete.surname)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Image(athlete.country.lowercased())
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                            }
                        }
                        .padding(16)
                    }
                }else if picker == 2 {
                    VStack{
                        VStack(alignment:.leading, spacing: 5) {
                            ForEach(viewModel.athletes, id:\.self){ athlete in
                                HStack{
                                    Image(athlete.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    VStack{
                                        Text(athlete.name)
                                            .foregroundColor(.body)
                                        Text(athlete.surname)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Image(athlete.country.lowercased())
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }                        }
                        }
                        .padding(16)
                    }
                }
            }
        }
    }
}

struct MoreFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        MoreFavoritesView()
    }
}
