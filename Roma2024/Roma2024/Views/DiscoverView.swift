//
//  DiscoverView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct DiscoverView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    @State var showProfile : Bool = false
    @State var showTicket : Bool = false
    @State var selectedCategory : NewsCategory = .none
    
    var filteredNews: [News] {
        if selectedCategory == .none {
            return viewModel.news
        }else{
            return viewModel.news.filter({$0.discipline == selectedCategory})
        }
    }
    
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
                                        .onTapGesture {
                                            selectedCategory = category
                                        }
                                }
                            }
                            .padding(16)
                            
                        }
                    }
                    .padding(.trailing,80)
                }
                
                Text("For You")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        HStack(spacing: 5) {
                            ForEach(viewModel.news, id:\.self){ news in
                                NewsCardBig(news: news)
                            }
                        }
                        .padding(16)
                        
                    }
                }
                
                Text("More")
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        VStack(alignment:.leading, spacing: 5) {
                            ForEach(filteredNews, id:\.self){ news in
                                NewsCardSmall(news: news)
                            }
                        }
                        .padding(16)
                        
                    }
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
