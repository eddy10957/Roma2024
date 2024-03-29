//
//  FloatingMenu.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 07/05/23.
//


import SwiftUI

struct FloatingMenu: View {
    @State var expand = true
    @State var angle = 90.0
    @Binding var showProfile: Bool
    @Binding var showTickets: Bool
    @Binding var showRedeems: Bool
    @EnvironmentObject var viewModel : ViewModel
    var body: some View {
        ZStack(alignment: .topTrailing) {
            if !expand {
                LinearGradient(colors: [.primaryBackground.opacity(0.8), .primaryBackground.opacity(0.3), .white], startPoint: .top, endPoint: .bottom)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea(.all, edges: [.top])
//                VStack(alignment: .center) {
//                    HStack {
//                        Spacer()
//                        Image("goldMedal")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 25, height: 25)
//                        Text(" \(viewModel.yourPoints)")
//                            .font(.body)
//                            .foregroundColor(.white)
//                        Spacer()
//                    }
//                    Spacer()
//                }
            }
            
            VStack {
                MainButton(action: {
                    expand.toggle()
                }, expand: $expand)
                if !expand {
                    MenuButton(action: {
                        showProfile = true
                    }, title: "Profile", image: "person.circle.fill", expand: $expand, offset: -20)
                    MenuButton(action: {
                        showTickets = true
                    }, title: "Tickets", image: "ticket.fill", expand: $expand, offset: -40)
                    MenuButton(action: {
                        showRedeems = true
                    }, title: "Redeems", image: "tray.circle.fill", expand: $expand, offset: -60)
                }
            }
        }
    }
}

// MARK: Button to open menu
struct MainButton: View {
    var action: () -> Void
    var firstImage: String = "minus"
    var secondImage: String = "minus"
    var size: CGFloat = 20
    @Binding var expand: Bool
    var offset: CGFloat = 0
    
    var body: some View {
        
        Button(action: action, label: {
            VStack {
                Image(systemName: firstImage)
                    .padding()
                    .rotationEffect(Angle(degrees: !expand ? 45 : 0))
                    .offset(y: !expand ? 7 : 0)
                Image(systemName: secondImage)
                    .rotationEffect(Angle(degrees: !expand ? -45 : 0))
                    .offset(y: !expand ? -7 : 0)
            }
            .font(.largeTitle)
            .foregroundColor(expand ? .hyperAccent : .body)
        })
        .padding(.bottom)
        .padding(.leading, !expand ? 60 : 0)
        .expandMenu(!expand, offset: offset)
        
    }
}

// MARK: Other menu buttons
struct MenuButton: View {
    var action: () -> Void
    var title: String
    var image: String
    @Binding var expand: Bool
    var offset: CGFloat
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Text(title)
                    .padding(5)
//                    .background(Color.hyperAccent)
//                    .cornerRadius(20)
                    .font(.footnote)
                    .foregroundColor(.body)
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(.body)
            }
        })
        .buttonStyle(.plain)
        .padding(5)
        .expandMenu(expand, offset: offset)
    }
}

//struct FloatingMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        FloatingMenu()
//    }
//}
