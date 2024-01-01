//
//  TicketView.swift
//  Movies
//
//  Created by Temiloluwa Akisanya on 01/01/2024.
//

import SwiftUI

struct TicketView: View {
    @State var animate = false
    
    var body: some View {
        ZStack {
            CircleBackground(color: Color("greenCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? 50 : -130, y: animate ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animate.toggle()
                    }
                }
            
            CircleBackground(color: Color("pinkCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
            
            VStack(spacing: 30.0) {
                Text("Mobile Ticket")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                Text("Once you buy a movie ticket you simply scan the barcode to gain access to your movies")
                    .frame(maxWidth: 248)
                    .font(.body)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }.background(
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    TicketView()
}
