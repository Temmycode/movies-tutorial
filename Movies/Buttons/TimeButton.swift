//
//  TimeButton.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-16.
//

import SwiftUI

struct TimeButton: View {
    @State var hour: String = "18:00"
    
    @State var width: CGFloat = 50
    @State var height: CGFloat = 40
    
    @Binding var isSelected: Bool
    @State var action: () -> Void = {}
    
    var currentBorderColors: [Color] = [Color("cyanColor"), Color("cyanColor").opacity(0), Color("cyanColor").opacity(0)]
    var currentGradient: [Color] = [Color("backgroundColor"), Color("greyColor")]
    
    var selectedBorderColors: [Color] = [Color("pinkColor"), Color("pinkColor").opacity(0), Color("pinkColor").opacity(0)]
    var selectedGradient: [Color] = [Color("majentaColor"), Color("backgroundColor")]
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(hour)
            }
            .font(.subheadline)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(LinearGradient(colors: isSelected ? selectedGradient : currentGradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(colors: isSelected ? selectedBorderColors : currentBorderColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                    .frame(width: width - 1, height: height - 1)
            }
        }
    }
}
