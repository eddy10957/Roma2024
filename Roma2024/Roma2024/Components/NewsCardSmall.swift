//
//  NewsCardSmall.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 08/05/23.
//

import SwiftUI

struct NewsCardSmall: View {
    var news : News
    var body: some View {
        HStack(alignment: .top){
            Image(news.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(15)
            
            VStack(alignment: .leading){
                Text(news.title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                Text(news.subtitle!)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)

            }
        }
    }
}

struct NewsCardSmall_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardSmall(news: News(title: "Record-Breaking Performances at European Athletics Championship", subtitle: "Athletes showcase incredible talent", articleText: "The European Athletics Championship witnessed a series of record-breaking performances across various disciplines. Athletes from different countries displayed their exceptional skills and set new benchmarks in events such as sprint, long jump, and javelin throw. The competition was fierce, and spectators were treated to thrilling moments.", discipline: .announcements, image: "generic1News"))
    }
}
