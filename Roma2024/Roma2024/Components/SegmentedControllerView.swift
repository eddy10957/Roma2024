//
//  SegmentedControllerView.swift
//  MotorLog2
//
//  Created by Andrea Masturzo on 17/01/23.
//

import SwiftUI

struct SegmentedControllerButton: View {
    @StateObject var viewRouter: ViewRouter
    
    var text: String
    let currentSelection: ViewSelection
    
    var body: some View {
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.hyperAccent)
                        .padding(2)
                        .opacity(viewRouter.currentView == currentSelection ? 1 : 0)
                }
                .padding(.horizontal, 3)
                .overlay(
                    Text(text)
                        .foregroundColor(Color.primaryDetail)
                    )
        }
        .frame(height: 30)
        .cornerRadius(0)
        .onTapGesture {
            withAnimation(.interactiveSpring(response: 0.2,
                                             dampingFraction: 2,
                                             blendDuration: 0.5)) {
                
                viewRouter.currentView = currentSelection
            }
            
        }
    }
}




struct SegmentedController: View {
    @StateObject var viewRouter: ViewRouter
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 11)
                .fill(Color.primaryBackground)
                .frame(height: 40)
            HStack(spacing: 0) {
                SegmentedControllerButton(viewRouter: viewRouter, text: "Works", currentSelection: .works)
                Divider()
                    .frame(height: 20)
//                SegmentedControllerButton(viewRouter: viewRouter, text: "Expires", currentSelection: .expires)
//                Divider()
//                    .frame(height: 20)
                SegmentedControllerButton(viewRouter: viewRouter, text: "Documents", currentSelection: .documents)
            }
        }
        .padding(.bottom)
    }
}
