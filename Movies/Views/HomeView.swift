//
//  HomeView.swift
//  Movies
//
//  Created by Temiloluwa Akisanya on 05/01/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var animate = false
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
            
            VStack(spacing: 0.0) {
                Text("Choose movie")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                CustomSearchBar()
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0) {
                        ScrollSection(title: "Now Playing", posters: posters1)
                        
                        ScrollSection(title: "Coming Soon", posters: posters2)
                        
                        ScrollSection(title: "Top Movies", posters: posters3)
                        
                        ScrollSection(title: "Favourite", posters: posters1)
                    }
                    .padding(.bottom, 90)
                }
            }
             .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    HomeView()
}
