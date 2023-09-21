//
//  FoldableView.swift
//  PracticeGenius
//
//  Created by Balita on 9/15/23.
//

import SwiftUI

// TODO: export this to MyCustomViews
struct FoldableView: View {
    @Binding var isFolded: Bool
    @Binding var isFoldedText: String
    var body: some View {
        VStack(spacing: 10) {
            Button("Ici pour \(isFoldedText)"){
                isFolded.toggle()
                isFoldedText = isFolded ? "déplier" : "plier"
            }
            if isFolded {
                Text("Je suis plié")
            }else{
                    Text("----------- DEPLIED -------")
            }
        }
       
    }
}

struct FoldableView_Previews: PreviewProvider {
    static var previews: some View {
        FoldableView(isFolded: .constant(false),isFoldedText: .constant("MIPIKA"))
    }
}
