//
//  PopUpView.swift
//  Ulisse
//
//  Created by Andrea Masturzo on 24/01/23.
//

import SwiftUI

struct PopUpView: View {
    @EnvironmentObject var locationManager: ViewModel

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let location: Poi
    @Binding var tappedLocation: Bool

    
    var body: some View {
        VStack {
            PopUpHeader(action: {
                tappedLocation = false
            }, locationType: location.name)
            Spacer()
                .frame(maxHeight: 14)
            Image(uiImage: location.image ?? UIImage(systemName: "photo")!)
                .resizable()
                .frame(maxHeight: 180)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text (location.name)
                    .font (.title2)
                    .padding(.bottom, 1)
                Spacer()
                    .frame(maxHeight: 8)
                Text (location.shortDescription)
                    .font(.subheadline)
                    .foregroundColor(.primaryHeadline)
                    .padding(.bottom, 5)
                Spacer()
                    .frame(maxHeight: 8)
                
                Button(action: {
                    print("dio cane")
                    tappedLocation = false
                }, label: {
                    Text("Dio cane")

                })
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(24)
        .frame(width: UIScreen.main.bounds.width - 64, height: UIScreen.main.bounds.height - 362)
    }
}

struct PopUpHeader: View {
    var action: () -> Void
    var locationType: String
    var body: some View {
        HStack {
//            Image("church.fill") // needs location type icon
            Text(locationType)
                .font(.subheadline)
                .foregroundColor(.primaryHeadline)
            Spacer()
            Button(action: action, label: {
                Image("close")
            })
        }
        .frame(width: UIScreen.main.bounds.width - 96)
    }
}
