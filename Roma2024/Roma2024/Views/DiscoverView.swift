//
//  DiscoverView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct DiscoverView: View {
    @State var showProfile : Bool = false
    @State var showTicket : Bool = false
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            HStack(spacing: 5) {
                                ForEach(NewsCategory.allCases, id: \.self) { category in
                                    Text(category.rawValue)
                                        .font(.headline)
                                        .padding()
                                }
                            }
                            .padding(16)
                            
                        }
                    }
                    .padding(.trailing,80)
                }
                Spacer()
            }
            
            VStack{
                HStack{
                    Spacer()
                    FloatingMenu(buttonArray: ["person","ticket"], onClick: { buttonClicked in
                        if buttonClicked == "person"{
                            showProfile.toggle()
                        }else if buttonClicked == "ticket"{
                            showTicket.toggle()
                        }
                    })
                    
                }
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $showProfile){
            ProfileView()
        }
        .fullScreenCover(isPresented: $showTicket){
            TicketsView()
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
