//
//  RealisationsDestinationView.swift
//  PracticeGenius
//
//  Created by Balita on 9/8/23.
//

import SwiftUI

struct RealisationsDestinationView: View {
    var firstImage: String
    var secondImage: String
    @State var shownImage: String
    
    init(firstImage: String = "abu_elephant", secondImage: String = "abu_monkey") {
        self.firstImage = firstImage
        self.secondImage = secondImage
        self.shownImage = self.firstImage
    }
    
    var body: some View {
        Button{
            shownImage = shownImage == firstImage ? secondImage : firstImage
        } label: {
            Image(shownImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
        }
    }
}

struct RealisationsDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        RealisationsDestinationView()
    }
}
