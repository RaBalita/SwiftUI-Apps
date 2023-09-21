//
//  DialogsView.swift
//  PracticeGenius
//
//  Created by Balita on 9/15/23.
//

import SwiftUI

struct DialogsView: View {
    @State var showAlert = false
    @State var labelColor: Color = .primary
    
    @State var showDialog = false
    @State var imageName = "tortoise"
    var imageNamesArray = ["tortoise", "lamp.desk", "hare", "windshield.front.and.fluid"]
    
    @State var bg: Color = .red
    
    var body: some View {
        
            VStack(spacing: 40){
                Spacer()
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .foregroundColor(labelColor)
                    .contextMenu{
                        Button{
                            bg = .red
                        } label: {
                            Label("Red", systemImage: "heart")
                        }
                        Button{
                            bg = .mint
                        } label: {
                            Label("Mint", systemImage: "thermometer.medium")
                        }
                    }
                    
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Label("Montrer alerte", systemImage: "arrowtriangle.up.circle")
                })
                Button{
                    showDialog = true
                } label: {
                    Label("Montrer dialogue", systemImage: "arrowtriangle.up.circle")
                        .foregroundColor(labelColor)
                }
                Spacer()
                
                HStack {
                    Spacer()
                }
        }
        .background(bg)
        .alert("Bokotra voalohany", isPresented: $showAlert) {
            Button("Ekena", role: .none) {
                labelColor = .primary
            }
            Button("Ajanona", role: .cancel) {
                labelColor = .accentColor
            }
            Button("Simbaina", role: .destructive) {
                labelColor = .red
            }
        } message: {
            Text("Vous avez montré une alerte !!!")
        }
        .confirmationDialog("Here is a confirmation Dialog", isPresented: $showDialog){
            
            ForEach(imageNamesArray, id: \.self){ string in
                Button{
                    imageName = string
                } label: {
                    Text(string)
                  //  Label(" ", systemImage: string)
                    
                }
            }
            
            Button(role: .cancel){
                    
                } label: {
                    Text("Ajanony")
                        .padding()
                }
        }
    }
}

struct DialogsView_Previews: PreviewProvider {
    static var previews: some View {
        DialogsView()
    }
}
