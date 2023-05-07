//
//  SplashView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 07/05/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image("Bg")
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Image("europeanAthletics")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("roma 2024")
                    .font(.largeTitle)
                    .bold()
                Text("#yoursportforlife")
                    .font(.title3)
                    .bold()
            }
            .foregroundColor(.secondaryBackground)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
