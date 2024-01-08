//
//  BookingView.swift
//  Movies
//
//  Created by Temiloluwa Akisanya on 07/01/2024.
//

import SwiftUI

struct BookingView: View {
    var gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2"), Color("backgroundColor2")]
    var body: some View {
        ZStack {
            Image("booking")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity, alignment: .top)
            
            VStack {
                LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                    .frame(height: 600)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack(spacing: 0.0) {
                HStack {
                    CircleButton(action: {}, image: "arrow.left")
                    
                    Spacer()
                    
                    CircleButton(action: {}, image: "ellipse ")
                }
                .padding (EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .background(.backgroundColor2)
        .ignoresSafeArea()
    }
}

#Preview {
    BookingView()
}
