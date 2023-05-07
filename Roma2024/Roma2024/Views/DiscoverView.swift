//
//  DiscoverView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        
        ZStack{
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(NewsCategory.allCases, id: \.self) { category in
                            Text(category.rawValue)
                                .font(.headline)
                                .padding()
                        }
                    }
                    .padding(16)
                }
                Spacer()
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
