//
//  NewsCardBig.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 07/05/23.
//

import SwiftUI

struct NewsCardBig: View {
    var image : String
    var title : String
    
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .frame(width: 200,height: 100)
                .overlay(alignment: .bottomLeading, content: {
                    Text(title)
                        .foregroundColor(.white)
                        .font(.caption)
                })
        }
    }
}

struct NewsCardBig_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardBig(image: "", title: "")
    }
}