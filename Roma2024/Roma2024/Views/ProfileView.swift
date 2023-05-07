//
//  ProfileView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var viewModel : ViewModel
    
    @State var notificationToggle : Bool = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Image(viewModel.profile.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 150)
                    .padding()
                        
                    VStack(alignment: .leading){
                        Text(viewModel.profile.name)
                        .font(.title)
                        Text(viewModel.profile.surname)
                        .font(.title2)
            
                    }
                }
                HStack{
                    Text("Favorites")
                        .font(.title)
                    Spacer()
                    Button {
                        print("more Clicked")
                    } label: {
                        Text("more")
                    }

                }
                Divider()
                
                
                
                VStack(alignment: .leading){
                    //MARK: Nations -
                    Text("Nations")
                        .font(.title2)
                    ScrollView(.horizontal){
                        HStack(spacing: 5){
                            ForEach(viewModel.favoritesCountries, id: \.self) { country in
                                Image(country.rawValue.lowercased())
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50,height: 50)
                            }
                        }
                    }
                    
                    //MARK: Athletes -
                    Text("Athletes")
                        .font(.title2)
                    ScrollView(.horizontal){
                        HStack(spacing: 5){
                            ForEach(viewModel.athletes.filter({
                                $0.isFavorite
                            }), id: \.self) { athlete in
                                Image(athlete.image)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 50,height: 50)
                            }
                        }
                    }
                    
                    //MARK: Disciplines -
                    Text("Disciplines")
                        .font(.title2)
                    ScrollView(.horizontal){
                        HStack(spacing: 5){
                            ForEach(viewModel.favoritesDisciplines, id: \.self) { discipline in
                                ZStack{
                                    Image(discipline.rawValue.lowercased())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40,height: 40)
                                        
                                    
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .frame(width: 50,height: 50)

                                        
                                }
                                .foregroundColor(Color.primaryDetail)

                            }
                        }
                    }
                }
                
                Text("Settings")
                    .font(.title)
                
                Divider()
                
                Toggle("Notifications", isOn: $notificationToggle)
                
            }
            .padding()
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.primaryDetail)
                        .onTapGesture {
                            presentation.wrappedValue.dismiss()
                        }
                }
            })
           
        }
        }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
