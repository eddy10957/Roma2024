//
//  NewsCardBig.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 07/05/23.
//

import SwiftUI

struct NewsCardBig: View {
    var news : News
    
    var body: some View {
        ZStack {
            Image(news.image)
                .resizable()
                .overlay(alignment: .bottomLeading) {
                    ZStack(alignment: .bottomLeading) {
                        LinearGradient(colors: [.black, .black.opacity(0.8), .black.opacity(0.5), .black.opacity(0.2), .black.opacity(0.1)], startPoint: .bottom, endPoint: .center)
                            .frame(width: 200)
                        Text(news.title)
                            .font(.caption)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.body)
                            .padding()
                    }
                }
        }
        .frame(width: 200,height: 150)
    }
}

struct NewsCardBig_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardBig(news: News(title: "Record-Breaking Performances at European Athletics Championship", subtitle: "Athletes showcase incredible talent", articleText: "The European Athletics Championship witnessed a series of record-breaking performances across various disciplines. Athletes from different countries displayed their exceptional skills and set new benchmarks in events such as sprint, long jump, and javelin throw. The competition was fierce, and spectators were treated to thrilling moments.", discipline: .announcements, image: "generic1News"))
    }
}
