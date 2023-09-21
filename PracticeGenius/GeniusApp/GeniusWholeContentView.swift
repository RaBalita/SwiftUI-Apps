//
//  GeniusWholeContentView.swift
//  PracticeGenius
//
//  Created by Balita on 9/15/23.
//

import SwiftUI

struct GeniusWholeContentView: View {
    @State var selection:Int = 0
    var myColor:Color = Color(red: 113/255, green: 34/255, blue: 119/255)
    
    var body: some View {
        TabView(selection: $selection) {
            GeniusHomeView()
                .tabItem {
                    Text("Accueil")
                    Image(systemName: "homepodmini")
                }.tag(0)
                .foregroundColor(myColor)
            RealisationsView()
                .tabItem {
                    Text("Réalisations")
                    Image(systemName: "lamp.desk")
                }.tag(1)
            LampView()
                .tabItem {
                    Text("Contact")
                    Image(systemName: "envelope.badge.shield.half.filled.fill")
                }.tag(2)
        }
    }
}

struct GeniusWholeContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusWholeContentView()
    }
}
