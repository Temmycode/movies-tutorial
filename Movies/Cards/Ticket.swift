//
//  Ticket.swift
//  Movies
//
//  Created by Temiloluwa Akisanya on 01/01/2024.
//

import SwiftUI

struct Ticket: View {
    @State var title = "Thor"
    @State var subtitle = "Love and Thunder"
    @State var top = "thor-top"
    @State var bottom = "thor-bottom"
    @Binding var height: CGFloat
    
    var gradient = [Color("cyan"), Color("cyan").opacity(0), Color("cyan").opacity(0)]
    
    var body: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 4.0) {
                Text(title)
                    .fontWeight(.bold)
                
                Text(subtitle)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            .frame(width: 250, height: 325, alignment: .top)
            .foregroundStyle(.white)
            .background(
                Image(top)
                    .resizable()
                    .scaledToFill()
            )
            .mask {
                Image(top)
                    .resizable()
                    .scaledToFill()
            }
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
            }
            .cornerRadius(40, corners: [.topLeft, .topRight])
            
            Spacer(minLength: height)
            
            //MARK: Date, Time, Row and Seats
            VStack(spacing: 10.0) {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
                    .frame(width: 200)
                    .opacity(0.6)
                
                HStack(spacing: 20) {
                    HStack(spacing: 4) {
                        Text("Date")
                            .fontWeight(.medium)
                            .foregroundStyle(.lightPurple)
                        Text("April 23")
                            .foregroundStyle(.black)
                    }
                    
                    HStack(spacing: 4) {
                        Text("Time:")
                            .fontWeight(.medium)
                            .foregroundStyle(.lightPurple)
                        Text("6 p.m.")
                            .foregroundStyle(.black)
                    }
                }
                
                HStack(spacing: 20) {
                    HStack(spacing: 4) {
                        Text("Row:")
                            .fontWeight(.medium)
                            .foregroundStyle(.lightPurple)
                        Text("2")
                            .foregroundStyle(.black)
                    }
                    
                    HStack(spacing: 4) {
                        Text("Seats")
                            .fontWeight(.medium)
                            .foregroundStyle(.lightPurple)
                        Text("9, 10")
                            .foregroundStyle(.black)
                    }
                }
                
                //MARK: Bar code
                Image("code")
            }
            .frame(width: 250, height: 135, alignment: .top)
            .background(.ultraThinMaterial)
            .background(
                Image(bottom)
                    .resizable()
                    .scaledToFill()
            )
            .mask(
                Image(bottom)
                    .resizable()
                    .scaledToFill()
            )

        }
        .frame(height: height)
        .font(.footnote)
        .shadow(radius: 10)
    }
}

#Preview {
    Ticket(height: .constant(0))
}
