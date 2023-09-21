//
//  GeniusHomeView.swift
//  PracticeGenius
//
//  Created by Balita on 9/8/23.
//

import SwiftUI

struct GeniusHomeView: View {
    var geniusText: String = "Venez me frotter la lampe pour obtenir vos 3 voeux, et ainsi réaliser vos rêves les plus fous."
    var body: some View {
        VStack {
            ZStack {
                Image("cover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 220)
                
                Color(.white)
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                    .shadow(color: .accentColor, radius: 12)
                    .offset(y: 60)
                    
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                    .shadow(color: .accentColor, radius: 12)
                    .offset(y: 60)
            }
            
            Text("L'app du Génie")
                .font(.largeTitle)
                .foregroundColor(.accentColor)
            
            Divider()
                .frame(height: 3)
                .overlay(.gray)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            Text(geniusText)
                .foregroundColor(.accentColor)
                .italic()
            
            Image("lamp")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 190)
                .cornerRadius(12)
                .padding()
            
            Spacer()
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct GeniusHomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusHomeView()
    }
}
