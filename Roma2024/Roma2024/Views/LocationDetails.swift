//
//  LocationDetails.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 09/05/23.
//

import SwiftUI

struct LocationDetails: View {
    
    @EnvironmentObject var locationManager: ViewModel
    let location: Poi
    @Binding var tappedLocation: Bool

    
    var body: some View {
        VStack{
            
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
            }
                Spacer()
                Button(action: {
                    print("dio cane")
                    tappedLocation = false
                }, label: {
                    Text("Dio cane")

                })
                .buttonStyle(.borderedProminent)
            Spacer()
            
        }
        .padding()
    }
}

//struct LocationDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationDetails()
//    }
//}
