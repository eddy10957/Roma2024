//
//  TicketsView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI

struct TicketsView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var viewModel : ViewModel
    
    // MARK: Animation Properties
    @State var expandCards: Bool = false
    
    @State var cardsArray = cards
    @State var allowReordering = true
    
    // MARK: Detail View Properties
    @State var currentCard: Card?
    @State var showDetailCard = false
    @Namespace var animation
    
    @State private var draggedCard: Card?
    @State var showDeleteButton = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text("Tickets")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: expandCards ? .leading : .center)
                .padding(.leading, expandCards ? 15 : 0)
                .opacity(showDetailCard ? 0 : 1)
                .overlay(alignment: .trailing) {
                    
                    // MARK: Close Button
                    Button(action: {
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                            expandCards = false
                        }
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color.primaryBackground)
                    })
                    .rotationEffect(.init(degrees: expandCards ? 45 : 0))
                    .offset(x: expandCards ? 10 : 15)
                    .opacity(expandCards ? 1 : 0)
                    .opacity(expandCards ? 1 : 0)
                }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    // MARK: Cards
                    ForEach(cards) { card in
                        Group {
                            // Remove this if...else for Pure transition
                            if currentCard?.id == card.id && showDetailCard {
                                CardView(card: card)
                                    .opacity(0)
                                
                            } else {
                                CardView(card: card)
                                    .matchedGeometryEffect(id: card.id, in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                currentCard = card
                                showDetailCard = true
                            }
                        }
                    }
                }
                .overlay {
                    // To avoid scrolling
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                expandCards = true
                            }
                        }
                }
                .padding(.top, expandCards ? 30 : 0)
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 : 30)
            
            // MARK: Add Button
            Button(action: {
            }, label: {
                    Text("Buy Ticket")
                        .foregroundColor(Color.white)
            })
            .buttonStyle(.borderedProminent)
            .rotationEffect(.init(degrees: expandCards ? 180 : 0))
            // To avoid warning 0.01
            .scaleEffect(expandCards ? 0.01 : 1)
            .opacity(!expandCards ? 1 : 0)
            .frame(height: expandCards ? 0 : nil)
            .padding(.bottom, expandCards ? 0 : 30)
        }
        .padding([.horizontal, .top])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            if let currentCard = currentCard, showDetailCard {
                DetailView(currentCard: currentCard, showDetailCard: $showDetailCard, animation: animation)
            }
        }
        .overlay(alignment: .topTrailing) {
            if !expandCards {
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.primaryDetail)
                    .onTapGesture {
                        presentation.wrappedValue.dismiss()
                    }
                    .padding()
            }
        }
    }
    
    // MARK: Card View
    @ViewBuilder
    func CardView(card: Card) -> some View {
        GeometryReader { geo in
            let rect = geo.frame(in: .named("SCROLL"))
            
            // To display some portion of each Card
            let offset = CGFloat(cards.firstIndex(of: card)! * (expandCards ? 10 : 70))
            
            
            ZStack(alignment: .bottomLeading) {
                // Image/Front of the Card in the Wallet list
                Rectangle()
                    .foregroundColor(Color.secondaryBackground)
                VStack(alignment: .leading) {
                    HStack {
                        Image("europeanAthletics")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        VStack(alignment: .leading) {
                            Text(card.name)
                                .font(.headline)
                                .bold()
                            Text(card.date)
                                .fontWeight(.medium)
                        }
                    }
                    .padding([.top, .horizontal])
                    Spacer()
                    Text("Olympic Stadium")
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding([.bottom, .horizontal])
                }
                .padding(5)
                .padding(.bottom, 10)
                
            }
            .cornerRadius(20)
            .shadow(color: .white, radius: 2, x: 0, y: 0)
            .padding(.horizontal, 3)
            .padding(.top, 3)
            
            // Making it a Stack
            .offset(y: expandCards ? offset : -rect.minY + offset)
        }
        // MaxSize
        .frame(height: 200)
    }
    
    // Retreiving Index
    func getIndex(Card: Card)-> Int {
        return cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
}



// MARK: Detail View
struct DetailView: View {
    
    var currentCard: Card
    @Binding var showDetailCard: Bool
    // Matched Geometry Effect
    var animation: Namespace.ID
    
    @ObservedObject var viewRouter: ViewRouter = ViewRouter.shared
    
    var body: some View {
        
        VStack {
            CardView()
                .matchedGeometryEffect(id: currentCard.id, in: animation)
                .frame(height: 200)
                .padding(.horizontal)
                .zIndex(10)
            GeometryReader { geo in
                
                VStack{
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(currentCard.user)
                                .fontWeight(.bold)
                                .font(.headline)
                            Text(currentCard.name)
                                .font(.subheadline)
                            
                        }
                        Spacer()
                    }
                    
                    VStack(spacing: 20) {
                        
                        // QR Code
                        Image(currentCard.image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .padding()
                
            }
            .padding(.top)
            .zIndex(-10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white.ignoresSafeArea())
    }
    @ViewBuilder
    func CardView() -> some View {
        ZStack(alignment: .bottomLeading) {
            // Image/Front of the Card in the Wallet list
            Rectangle()
                .foregroundColor(Color.secondaryBackground)
            VStack(alignment: .leading) {
                HStack {
                    Image(currentCard.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    VStack(alignment: .leading) {
                        Text(currentCard.name)
                            .font(.headline)
                            .bold()
                        Text(currentCard.date)
                            .fontWeight(.medium)
                    }
                }
                .padding([.top, .horizontal])
                Spacer()
                Text("Olympic Stadium")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding([.bottom, .horizontal])
            }
            .padding(5)
            .padding(.bottom, 10)
            
        }
        .cornerRadius(20)
        .shadow(color: .white, radius: 2, x: 0, y: 0)
        .padding(.horizontal, 3)
        .padding(.top, 3)
        .overlay(alignment: .topTrailing) {
            // MARK: Close DetailView Button
            Button(action: {
                // Closing expenses view first
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        showDetailCard = false
                    }
                })
            }, label: {
//                Image(systemName: "xmark")
//                    .resizable()
//                    .foregroundColor(.hyperAccent)
//                    .frame(width: 20, height: 20)
//                    .padding(.trailing)
//                    .padding(.top, 30)
                
                ZStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.primaryBackground)
                        .frame(width: 30, height: 30)
                        .rotationEffect(.init(degrees: 45))
                }
                .padding(.trailing)
                .padding(.top, 30)
            })
        }
    }
}

// MARK: Card Model & SampleData

struct Card: Identifiable, Hashable {
    var logo: String = "europeanAthletics"
    var id = UUID().uuidString
    var name: String
    var date: String
    var image: String
    var user: String
}

var cards: [Card] = [
    Card(name: "100m Men's Final", date: "07/06", image: "qrcode", user: "Raffaele Sicimmanu"),
    Card(name: "High Jump Men's Qualification", date: "08/06", image: "qrcode", user: "Raffaele Sicimmanu"),
    Card(name: "Triple Jump Women's Qualification", date: "09/06", image: "qrcode", user: "Raffaele Sicimmanu"),
    Card(name: "800m Men's Final", date: "10/06", image: "qrcode", user: "Raffaele Sicimmanu"),
    Card(name: "200m Women's Semifinal", date: "11/06", image: "qrcode", user: "Raffaele Sicimmanu"),
    Card(name: "Shot Put Men's Final", date: "12/06", image: "qrcode", user: "Raffaele Sicimmanu")
]

class ViewRouter: ObservableObject {
    
    static var shared = ViewRouter()
    @Published var currentView: ViewSelection = .works
}

enum ViewSelection {
    case works, documents
}


struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
    }
}

