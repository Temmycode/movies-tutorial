//
//  LargeButton.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-19.
//

import SwiftUI

struct LargeButton: View {
    var selectedBorderColors: [Color] = [Color("pinkColor"), Color("pinkColor").opacity(0), Color("pinkColor").opacity(0)]
    
    var body: some View {
        Text("Reservation")
            .font(.body)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(LinearGradient(colors: [Color("majentaColor"), Color("purpleColor")], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(colors: selectedBorderColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                    .frame(maxWidth: .infinity, maxHeight: 58)
            }
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton()
    }
}
