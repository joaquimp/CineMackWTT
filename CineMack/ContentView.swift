
//
//  ContentView.swift
//  CineMack
//
//  Created by Joaquim Pessoa Filho on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var valor = 0.0
    
    enum TipoAssento {
        case disponivel
        case indisponivel
        case selecionado
    }
    @State var assentos: [TipoAssento] = [
        .disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,
        .disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.indisponivel,.disponivel,.disponivel,
        .disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,
        .disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,
        .disponivel,.indisponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,
        .disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.indisponivel,
        .disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,
        .disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel,.disponivel
    ]
    
    let adaptiveGridItem = [
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30))
    ]
    
    
    var body: some View {
        ZStack {
            // Define a cor do fundo
            Color("backgroundCineColor")
                .ignoresSafeArea()
            
            VStack {
                Image("capa")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                
                VStack {
                    Text("A Forja")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("16:40")
                        .font(.title2)
                        .fontWeight(.thin)
                    Spacer()
                    

                    // Versão LazyGrid (v4)
                    LazyVGrid(columns: adaptiveGridItem, spacing: 5) {
                        ForEach(Array(assentos.enumerated()), id: \.offset) { index, element in
                            
                            Button {
                                if assentos[index] == .indisponivel {
                                    return
                                }
                                assentos[index] = assentos[index] == .selecionado ? .disponivel : .selecionado
                                if assentos[index] == .selecionado {
                                    valor += 25
                                } else {
                                    valor -= 25
                                }
                                
                            } label: {
                                switch assentos[index] {
                                case .selecionado:
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("primaryCineColor"))
                                        .frame(width: 30, height: 30)
                                case .disponivel:
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("availableCineColor"))
                                        .frame(width: 30, height: 30)
                                case .indisponivel:
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("unavailableCineColor"))
                                        .frame(width: 30, height: 30)
                                }
                                
                            }.disabled(assentos[index] == .indisponivel)
                        }
                    }
                    
                    Spacer()
                    
                    // Tela
                    VStack {
                        Text("tela")
                        Rectangle()
                            .fill(Color("secondaryCineColor"))
                            .frame(maxWidth: .infinity, maxHeight: 16)
                    }
                    .padding(.top, 20)
                    
                    LegendaView()
                        .padding([.top, .bottom], 20)
                    
                    Button {
                        print("comprou")
                    } label: {
                        VStack {
                            Text("Comprar")
                                .font(.title2)
                            Text("R$ \(valor, specifier: "%.2f")")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color("buttonTextCineColor"))
                        .padding()
                        .background(Color("primaryCineColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                    }
                    
                }
                .padding([.trailing, .leading], 20)
                .padding(.bottom, 40)
                
            }
            .ignoresSafeArea()
        }
        .foregroundStyle(Color("foregroundCineColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




