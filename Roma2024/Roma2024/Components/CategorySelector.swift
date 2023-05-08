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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    HStack {
                        ForEach(NewsCategory.allCases, id: \.self) { category in
                            VStack(alignment: .center, spacing: 0){
                                Text(category.rawValue)
                                    .font(.callout)
                                    .padding(.horizontal)
                                    .foregroundColor(selectedCategory == category ? .hyperAccent : .black)
                                    .onTapGesture {
                                        selectedCategory = category
                                    } 
//                                if category == selectedCategory {
//                                    Rectangle()
//                                        .frame(height: 3)
//                                        .frame(maxWidth: 20)
//                                        .foregroundColor(Color.hyperAccent)
//                                }
                            }
                        }
                    }
                    .padding(16)
                    
                }
            }
            .padding(.trailing,80)
    }
}

//struct CategorySelector_Previews: PreviewProvider {
//    static var previews: some View {
//        CategorySelector()
//    }
//}
