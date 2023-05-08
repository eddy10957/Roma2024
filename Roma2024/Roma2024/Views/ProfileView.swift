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
        VStack(alignment: .leading) {
            profileHeader
            HStack {
                Text("Favorites")
                    .font(.title)
                Spacer()
                Button(action: {
                    print("more Clicked")
                }, label: {
                    Text("more")
                })
                .tint(.hyperAccent)
            }
            .padding(.horizontal)
            
            Divider()
            
            VStack(alignment: .leading) {
                nations
                
                athletes
                
                discipline
            }
            
            Text("Settings")
                .font(.title)
            
            Divider()
            
            Toggle("Notifications", isOn: $notificationToggle)
            Spacer()
            
        }
        .overlay(alignment: .topTrailing) {
            Image(systemName: "chevron.down")
                .foregroundColor(Color.primaryDetail)
                .onTapGesture {
                    presentation.wrappedValue.dismiss()
                }
                .padding()
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
        }
        .padding()
    }
    
    /// Nations ScrollView
    private var nations: some View {
        return Group {
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
        return Group {
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
        return Group {
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
