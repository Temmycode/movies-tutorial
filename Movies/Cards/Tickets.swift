//
//  Tickets.swift
//  Movies
//
//  Created by Temiloluwa Akisanya on 01/01/2024.
//

import SwiftUI

struct Tickets: View {
    @State var tickets: [TicketModel] = [
        TicketModel(image: "thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
        TicketModel(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
        TicketModel(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Madness", top: "scarlet-top", bottom: "scarlet-bottom")
    ]
    
    var body: some View {
        ZStack {
            ForEach(tickets) { ticket in
                InfiniteStackView(tickets: $tickets, ticket: ticket)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    Tickets()
}

struct InfiniteStackView: View {
    @Binding var tickets: [TicketModel]
    @State var height: CGFloat = 0
    var ticket: TicketModel
    
    var body: some View {
        VStack {
            Ticket(title: ticket.title, subtitle: ticket.subtitle, top: ticket.top, bottom: ticket.bottom, height: $height)
        }
    }
}
