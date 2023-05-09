//
//  MapView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {
            
//            Image("map")
            Image("map2")
                .resizable()
                .scaledToFill()
                
            HStack{
                ZStack(alignment: .center){
                    
                    
                    Circle()
                        .fill()
                        .frame(width: 50,height: 50)
                        .foregroundColor(.primaryBackground)
                    
                    Image("path")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        
                }
                
                
                Spacer()
                
                ZStack(alignment: .top){
                    
                    
                    Circle()
                        .fill()
                        .frame(width: 50,height: 50)
                        .foregroundColor(.primaryBackground)
                    
                    Image("colosseum")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                    
                }
                    
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
