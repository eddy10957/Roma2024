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
        VStack{
            Image(news.image)
                .resizable()
                .frame(width: 200,height: 100)
                
            Text(news.title)
                .font(.caption)
                .multilineTextAlignment(.leading)
                .frame(width: 200)
        }
    }
}

struct NewsCardBig_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardBig(news: News(title: "Record-Breaking Performances at European Athletics Championship", subtitle: "Athletes showcase incredible talent", articleText: "The European Athletics Championship witnessed a series of record-breaking performances across various disciplines. Athletes from different countries displayed their exceptional skills and set new benchmarks in events such as sprint, long jump, and javelin throw. The competition was fierce, and spectators were treated to thrilling moments.", discipline: .announcements, image: "generic1News"))
    }
}
