//
//  CategorySelector.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct CategorySelector: View {
    @Binding var selectedCategory: NewsCategory
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    HStack( spacing: 5) {
                        ForEach(NewsCategory.allCases, id: \.self) { category in
                            VStack(alignment: .leading){
                                Text(category.rawValue)
                                    .font(.headline)
                                    .padding()
                                    .onTapGesture {
                                        selectedCategory = category
                                    }
                                
                                if category == selectedCategory {
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(Color.hyperAccent)
                                }
                            }
                        }
                    }
                    .padding(16)
                    
                }
            }
            .padding(.trailing,80)
        }
    }
}

//struct CategorySelector_Previews: PreviewProvider {
//    static var previews: some View {
//        CategorySelector()
//    }
//}
