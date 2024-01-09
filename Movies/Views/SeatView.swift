//
//  SeatView.swift
//  Movies
//
//  Created by Temiloluwa Akisanya on 09/01/2024.
//

import SwiftUI

struct SeatView: View {
    @Environment(\.dismiss) var popView
    @State var animate = false
    @State var showButton = false
    
    var body: some View {
        VStack {
            HStack {
                CircleButton(action: {popView()}, image: "arrow.left")
                
                Spacer()
                
                Text("Choose Seat")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Spacer()
                
                CircleButton(action: {}, image: "calendar")
            }
            .padding(.top, 46)
            .padding(.horizontal, 20)
            
            Image("frontSeat")
                .padding(.top, 55)
                .glow(color: Color("pinkColor"), radius: 20)
            
            Image("seats")
                .frame(height: 240)
                .padding(.top, 60)
                .padding(.horizontal, 20)
                .onTapGesture {
                    withAnimation(.bouncy) {
                        showButton = true
                    }
                }
            
            HStack(spacing: 20.0) {
                StatusUI()
                
                StatusUI(color: .majenta, text: "Reserved")
                
                StatusUI(color: .cyan, text: "Selected")
            }
            .padding(.top, 60)
            
            ZStack(alignment: .topLeading) {
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundStyle(Color("purpleColor"))
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? -100 : 20, y: animate ? -20 : 20)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            animate.toggle()
                        }
                    }
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundStyle(Color("lightBlue"))
                    .blur(radius: animate ? 50 : 100)
                    .offset(x: animate ? 50 : 70, y: animate ? 70 : 30)
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundStyle(Color("pinkColor"))
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? 1500 : 170, y: animate ? 90 : 100)
                
                
                VStack(alignment: .leading, spacing: 30.0) {
                    HStack(spacing: 10.0) {
                       Image(systemName: "calendar")
                        Text("April 28, 2024")
                        Circle()
                            .frame(width: 6, height: 6)
                        Text("6 p.m.")
                   }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "ticket.fill")
                         Text("VIP Section")
                         Circle()
                             .frame(width: 6, height: 6)
                         Text("Seat 9, 10")
                    }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "cart.fill")
                         Text("Total: $30")
                    }
                }
                .padding(42)
                .font(.subheadline)
                
                HStack {
                    Spacer()
                    
                    RoundButton() {
                        NavigationUtil.popToRootView()
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
            .foregroundStyle(.white)
            .background(.ultraThinMaterial)
            .padding(.top, 50)
            .offset(y: showButton ? 0 : 250)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SeatView()
}


