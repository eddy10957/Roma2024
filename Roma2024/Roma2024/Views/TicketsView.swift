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
    
    var body: some View {
        NavigationView {
            VStack {
                Text("TicketView")
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.primaryDetail)
                        .onTapGesture {
                            presentation.wrappedValue.dismiss()
                        }
                }
            })
        }
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
    }
}
