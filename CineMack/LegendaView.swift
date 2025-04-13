//
//  LegendaView.swift
//  CineMack
//
//  Created by Joaquim Pessoa Filho on 13/04/25.
//

import SwiftUI

struct LegendaView: View {
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Circle()
                    .fill(Color("availableCineColor"))
                    .frame(width: 16, height: 16)
                Text("livre")
            }
            Spacer()
            HStack {
                Circle()
                    .fill(Color("primaryCineColor")) // .primary é do sistema
                    .frame(width: 16, height: 16)
                Text("selecionado")
            }
            Spacer()
            HStack {
                Circle()
                    .fill(Color("unavailableCineColor"))
                    .frame(width: 16, height: 16)
                Text("indisponível")
            }
            Spacer()
        }
    }
}

struct preview_LegendaView: PreviewProvider {
    static var previews: some View {
        LegendaView()
    }
}
