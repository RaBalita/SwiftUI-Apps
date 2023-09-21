//
//  SheetInstaView.swift
//  PracticeGenius
//
//  Created by Balita on 9/16/23.
//

import SwiftUI

struct SheetInstaView: View {
    @Environment(\.dismiss) var dismiss
    var postInsta: PostInsta
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button("X"){
                    dismiss()
                }
                .buttonStyle(.bordered)
                .padding(.trailing)
            }.padding(.top)
                
            Image(postInsta.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 380)
            
            HStack (alignment: .lastTextBaseline) {
                
                
                
                    Image(systemName: "heart")
                postInsta.numberOfLikes <= 1 ?
                    Text("\(postInsta.numberOfLikes) Like")
                :
                    
                    Text("\(postInsta.numberOfLikes) Likes")
                
                
                Spacer()
                postInsta.numberOfMessages <= 1 ?
                Text("\(postInsta.numberOfMessages) Message")
                :
                Text("\(postInsta.numberOfMessages) Messages")
                
                
            }
            .padding( )
            
            Spacer()
 
        }
    }
}

struct SheetInstaView_Previews: PreviewProvider {
    static var previews: some View {
        SheetInstaView(postInsta: PostInsta(imageName: "bball"))
    }
}


/*  put in the Content View for the whole Insta app:
 
 VStack {
     HeaderInstaView()
     StoryInstaView()
     PostInstaView()
 }
 
 */
