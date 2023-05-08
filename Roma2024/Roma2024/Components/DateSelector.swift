//
//  DateSelector.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 08/05/23.
//

import SwiftUI

struct DateSelector: View {
    
    var days : [String] = ["Ven\n 07/05","Sab\n 08/05","Dom\n 09/05","Lun\n 10/05","Mar\n 11/05","Mer\n 12/05"]
    
    @Binding var selectedDate: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(days, id: \.self){ day in
                        VStack{
                            Text(day)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .font(.footnote)
                                .padding(.horizontal, 5)
                                .foregroundColor(selectedDate == day ? Color.hyperAccent : Color.black)
                                .onTapGesture {
                                    selectedDate = day
                                }
//                            if day == selectedDate {
//                                Rectangle()
//                                    .frame(height: 2)
//                                    .foregroundColor(Color.hyperAccent)
//                            }
                        }
                    }
                }
                .padding(16)
        }
        .padding(.trailing, 60)
    }
}

struct DateSelector_Previews: PreviewProvider {
    static var previews: some View {
        DateSelector(selectedDate: .constant("Ven\n 07/05"))
    }
}
