//
//  StoryInstaView.swift
//  PracticeGenius
//
//  Created by Balita on 9/16/23.
//

import SwiftUI

struct StoryInstaView: View {
    let subjects: [Subject] = [
        Subject(topic: "Fun", color: .purple),
        Subject(topic: "Food", color: .orange),
        Subject(topic: "Sport", color: .mint),
        Subject(topic: "Code", color: .blue),
        Subject(topic: "Bordel", color: .pink)
    ]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Trending stories")
                .font(.title2)
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 0))
            ScrollView(.horizontal) {
                HStack {
                    ForEach(subjects) { sub in
                        Text(sub.topic)
                            .frame(width: 100, height: 40)
                            .background(sub.color)
                            .cornerRadius(20)
                    }
                }

            }
            
            Divider()
                .frame(height: 3)
                .overlay {
                    Color.accentColor
                }
        }
    }
}

struct StoryInstaView_Previews: PreviewProvider {
    static var previews: some View {
        StoryInstaView()
    }
}

struct Subject: Identifiable {
    var id = UUID()
    var topic: String = ""
    var color: Color = .accentColor
}


/*  put in the Content View for the whole Insta app:
 
 VStack {
     HeaderInstaView()
     StoryInstaView()
     PostInstaView()
 }
 
 */
