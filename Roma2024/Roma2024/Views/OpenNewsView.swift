//
//  OpenNewsView.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 08/05/23.
//

import SwiftUI

struct OpenNewsView: View {
    var news : News
    var body: some View {
        VStack{
            Image(news.image)
                .resizable()
                .scaledToFill()
                .frame(width: 300,height: 300)
                .clipped()
            
            VStack(alignment: .leading){
                Text(news.title)
                    .font(.headline)
                Text(news.subtitle!)
                    .font(.subheadline)
                Text(news.articleText)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        
        
        
    }
}

struct OpenNewsView_Previews: PreviewProvider {
    static var previews: some View {
        OpenNewsView(news: News(title: "Record-Breaking Performances at European Athletics Championship", subtitle: "Athletes showcase incredible talent", articleText: "The European Athletics Championship witnessed a series of record-breaking performances across various disciplines. Athletes from different countries displayed their exceptional skills and set new benchmarks in events such as sprint, long jump, and javelin throw. The competition was fierce, and spectators were treated to thrilling moments.", discipline: .announcements, image: "generic1News"))
    }
}
