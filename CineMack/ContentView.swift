//
//  ContentView.swift
//  CineMack
//
//  Created by Joaquim Pessoa Filho on 13/04/25.
//

import SwiftUI

struct ContentView: View {
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
                    
                    //Assentos
                    // Estudar ForEach
                    VStack {
                        HStack {
                            // Assento selecionado
                            Button {
                                print("Assento escolhido")
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color("primaryCineColor"))
                                    .frame(maxWidth: 40, maxHeight: 40)
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
                    .padding(.top, 40)
                    
                    LegendaView()
                        .padding([.top, .bottom], 40)
                    
                    Button {
                        print("comprou")
                    } label: {
                        VStack {
                            Text("Comprar")
                                .font(.title2)
                            Text("R$ 125,00")
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
