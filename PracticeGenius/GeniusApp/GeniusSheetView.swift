//
//  GeniusSheetView.swift
//  PracticeGenius
//
//  Created by Balita on 9/8/23.
//

import SwiftUI

struct GeniusSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Bien au chaud à l'intérieur de la lampe !")
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                .padding(.top)
                
            Image("dans_lampe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 380)
            
            Spacer()
            
            Button("Fermer"){
                dismiss()
            }
            .buttonStyle(.bordered)
        }
    }
}

struct GeniusSheetView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusSheetView()
    }
}
