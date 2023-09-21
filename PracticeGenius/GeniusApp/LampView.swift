//
//  LampView.swift
//  PracticeGenius
//
//  Created by Balita on 9/8/23.
//

import SwiftUI

struct LampView: View {
    let alertText: String = "Attention !!!\nVous ne pourrez prendre QUE la lampe dans cette cave aux merveilles."
    @State var showGeniusSheet: Bool = false
    var body: some View {
        VStack {
            Text("Où me trouver ?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
            
            Image("cave_outside")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 240)
            
            Button("Dans la cave des merveilles"){
                showGeniusSheet.toggle()
            }.buttonStyle(.borderedProminent)
            
            Image("cave_inside")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 190)
                .cornerRadius(12)
                .padding()
            
            Spacer()
            Text(alertText)
                .font(.caption)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
        }.sheet(isPresented: $showGeniusSheet){
            GeniusSheetView()
                .presentationDetents([.fraction(0.7)])
        }
    }
}

struct LampView_Previews: PreviewProvider {
    static var previews: some View {
        LampView()
    }
}
