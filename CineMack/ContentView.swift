
//
//  ContentView.swift
//  CineMack
//
//  Created by Joaquim Pessoa Filho on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var valor = 0.0
    @State var assentos = [false, false, false]
    
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
                    
                    // Assentos (v1)
                    VStack {
                        HStack {
                            // Assento selecionado
                            Button {
                                assentos[0].toggle()
                                if assentos[0] == true {
                                    valor += 25
                                } else {
                                    valor -= 25
                                }
                            } label: {
                                if assentos[0] == true {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color("primaryCineColor"))
                                        .frame(maxWidth: 40, maxHeight: 40)
                                } else {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color("availableCineColor"))
                                        .frame(maxWidth: 40, maxHeight: 40)
                                }
                            }

                            // Assento disponivel
                            Button {
                                print("Assento escolhido")
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color("availableCineColor"))
                                    .frame(maxWidth: 40, maxHeight: 40)
                            }

                            // Assento indisponivel
                            Button {
                                print("Assento escolhido")
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color("unavailableCineColor"))
                                    .frame(maxWidth: 40, maxHeight: 40)
                            }
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
