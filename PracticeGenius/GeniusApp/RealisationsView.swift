//
//  RealisationsView.swift
//  PracticeGenius
//
//  Created by Balita on 9/8/23.
//

import SwiftUI

struct RealisationsView: View {
    let headerText: String = "Préparez vous à rester bouche bée.\nMes réalisations sont plus folles les unes que les autres !"
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    Text(headerText)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                    
                    Image("genie")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360, height: 200)
                    
                    HStack {
                        Image("aladdin")
                            .resizable()
                            .frame(width: 120, height: 90)
                            .cornerRadius(10)
                        
                        NavigationLink("Voulez-vous voir le fabuleux makeover de notre cher\nAladdin ?"){
                            RealisationsDestinationView(firstImage: "aladdin", secondImage: "ali")
                        }
                    }
                    
                    
                    NavigationLink{
                        RealisationsDestinationView(firstImage: "jafar", secondImage: "jafar_snake")
                    }
                label: {
                    VStack{
                        Text("Quelle était la mauvaise idée de Jafar ?")
                        Image("jafar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    }
                    .padding()
                    .background(.mint)
                    .cornerRadius(12)
                    
                }
                    NavigationLink("Et Abu dans tout cela ?"){
                        RealisationsDestinationView(firstImage: "abu_monkey", secondImage: "abu_elephant")
                    }
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 20, trailing: 0))
                    
                    Image("applause")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    
                    Text("Alors c'est qui l'artiste ?")
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 30, trailing: 0))
                    
                }
            }
            .navigationTitle("Réalisations")
        }
    }
}

struct RealisationsView_Previews: PreviewProvider {
    static var previews: some View {
        RealisationsView()
    }
}
