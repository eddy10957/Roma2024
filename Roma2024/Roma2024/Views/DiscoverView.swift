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
    @State var selectedCategory : NewsCategory = .all
    
    var filteredNews: [News] {
        if selectedCategory == .all {
            return viewModel.news
        }else{
            return viewModel.news.filter({$0.discipline == selectedCategory})
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading){
                    CategorySelector(selectedCategory: $selectedCategory)
                    
                    Text("For You")
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            HStack(alignment:.top) {
                                ForEach(viewModel.news, id:\.self){ news in
                                    NavigationLink(destination: OpenNewsView(news: news), label: {NewsCardBig(news: news)})
                                    
                                }
                            }
                            .padding(16)
                            
                        }
                    }
                    
                    Text("More")
                        .padding()
                    
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
            }
            .fullScreenCover(isPresented: $showProfile){
                ProfileView()
            }
            .fullScreenCover(isPresented: $showTicket){
                TicketsView()
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
