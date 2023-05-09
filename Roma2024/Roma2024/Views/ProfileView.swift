//
//  ProfileView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var viewModel: ViewModel
    
    @State var notificationToggle : Bool = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                
                profileHeader
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Favorites")
                            .font(.title2)
                        Spacer()
                        //                    Button(action: {
                        //                        print("more Clicked")
                        //                    }, label: {
                        //                        Text("more")
                        //                    })
                        //                    .tint(.hyperAccent)
                        
                        NavigationLink {
                            MoreFavoritesView()
                        } label: {
                            Text("more")
                                .tint(.hyperAccent)
                        }
                        
                    }
                    
                    Divider()
                }
                
                nations
                
                athletes
                
                discipline
                
                Spacer()
                    .frame(maxHeight: 40)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Settings")
                        .font(.title2)
                    
                    Divider()
                }
                
                VStack(spacing: 20) {
                    Toggle("Notifications", isOn: $notificationToggle)
                    
                    Spacer()
                        .frame(maxHeight: 40)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Privacy Policy")
                            .font(.footnote)
                            .underline(true)
                    })
                }
                
                
                Spacer()
                
            }
            .padding()
            .overlay(alignment: .topTrailing) {
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.primaryDetail)
                    .onTapGesture {
                        presentation.wrappedValue.dismiss()
                    }
                    .padding()
            }
        }
    }
    
    /// Header with profile picture, name and surname
    private var profileHeader: some View {
        return HStack {
            Image(viewModel.profile.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(height: 120)
            
            VStack(alignment: .leading){
                Text(viewModel.profile.name)
                    .font(.title)
                Text(viewModel.profile.surname)
                    .font(.title2)
            }
            Spacer()
        }
    }
    
    /// Nations ScrollView
    private var nations: some View {
        return VStack(alignment: .leading, spacing: 3) {
            Text("Nations")
                .font(.headline)
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    ForEach(viewModel.favoritesCountries, id: \.self) { country in
                        FavoritesElement(favoriteType: .nation, imageName: country.rawValue)
                    }
                }
            }
        }
    }
    
    /// Athletes ScrollView
    private var athletes: some View {
        return VStack(alignment: .leading, spacing: 3) {
            Text("Athletes")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 5){
                    ForEach(viewModel.athletes.filter({
                        $0.isFavorite
                    }), id: \.self) { athlete in
                        FavoritesElement(favoriteType: .athlete, imageName: athlete.image)
                    }
                }
            }
        }
    }
    
    /// Disciplines ScrollView
    private var discipline: some View {
        return VStack(alignment: .leading, spacing: 3) {
            Text("Disciplines")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 5){
                    ForEach(viewModel.favoritesDisciplines, id: \.self) { discipline in
                        FavoritesElement(favoriteType: .discipline, imageName: discipline.rawValue)
                    }
                }
            }
        }
    }
}

/// Type to define the type of the favorite in order to create its circle inside
enum FavoriteType {
    case nation, athlete, discipline
}

struct FavoritesElement: View {
    var favoriteType: FavoriteType
    var imageName: String
    var body: some View {
        if favoriteType == .nation {
            Image(imageName.lowercased())
                .resizable()
                .scaledToFill()
                .frame(width: 50,height: 50)
        } else if favoriteType == .athlete {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 50,height: 50)
            
        } else if favoriteType == .discipline {
            ZStack {
                Circle()
                    .frame(width: 50,height: 50)
                    .foregroundColor(Color.primaryBackground)
                Image(imageName.lowercased())
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
