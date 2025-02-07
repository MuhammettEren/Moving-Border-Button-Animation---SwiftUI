//
//  ContentView.swift
//  MovingAnimationBorderButton
//
//  Created by Muhammet Eren on 7.02.2025.
//

import SwiftUI

struct MovingBorderButton: View {
    @State private var isMovingAround: Bool = false
    var body: some View {
        ZStack{
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 27)
                        .frame(width: 160, height: 54)
                        .foregroundStyle(Color.indigo.gradient)
                    RoundedRectangle(cornerRadius: 27)
                        .strokeBorder(style: StrokeStyle(lineWidth: 5,lineCap: .round,lineJoin: .round,dash: [40,400],dashPhase: isMovingAround ? 220 : -220))
                        .frame(width: 160, height: 54)
                        .foregroundStyle(
                            LinearGradient(colors: [.indigo, .white,.purple,.pink], startPoint: .trailing, endPoint: .leading)
                        )
                        .shadow(radius: 2)
                        
                    HStack{
                        Text("Get Started")
                            .foregroundColor(Color.white)
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color.white)
                        
                    }
                    .bold()
                }
            }
            .buttonStyle(.plain)

        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.black)
        .onAppear{
            withAnimation(.easeIn.speed(0.1).repeatForever(autoreverses: false)){
                isMovingAround.toggle()
            }
        }
    }
}

#Preview {
    MovingBorderButton()
}
