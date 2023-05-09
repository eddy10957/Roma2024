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
            
            ZStack {
                
                // Competition Venue
                Button {
                    
                } label: {
                    MapPin(width: 30)
                }
                .offset(x: -85, y: -270)
                
                // Warm-Up Area
                Button {
                    
                } label: {
                    MapPin(width: 30)
                }
                .offset(x: 90, y: -310)
                
                // Court 1
                Button {
                    
                } label: {
                    MapPin(width: 30)
                }
                .offset(x: -30, y: -10)
                
                // Court 2
                Button {
                    
                } label: {
                    MapPin(width: 30)
                }
                .offset(x: -15, y: 75)
                
                // Court 3
                Button {
                    
                } label: {
                    MapPin(width: 30)
                }
                .offset(x: -3, y: 135)
                
                // Court 4
                Button {
                    
                } label: {
                    MapPin(width: 30)
                }
                .offset(x: 18, y: 225)
                
                // Court 5
                Button {
                    
                } label: {
                    MapPin(width: 30)
                }
                .offset(x: 30, y: 290)
            }
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


struct MapPin: View {
    @State var width : CGFloat
    var body: some View {
        VStack(spacing: 0) {
                    Image(systemName: "map.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: width)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.primaryBackground)
                        .clipShape(Circle())
                    
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.primaryBackground)
                        .frame(width: width/3, height: width/3)
                        .rotationEffect(Angle(degrees: 180))
                        .offset(y: -3)
                }
    }
}
