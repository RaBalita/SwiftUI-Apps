//
//  PostInstaView.swift
//  PracticeGenius
//
//  Created by Balita on 9/16/23.
//

import SwiftUI

struct PostInstaView: View {
    let posts: [PostInsta] = [
        PostInsta(imageName: "bball", numberOfLikes: 10, numberOfMessages: 0),
        PostInsta(imageName: "boreal", numberOfLikes: 8, numberOfMessages: 2),
        PostInsta(imageName: "code", numberOfMessages: 5),
        PostInsta(imageName: "macaron"),
        PostInsta(imageName: "code2"),
        PostInsta(imageName: "mario"),
        PostInsta(imageName: "meuh"),
        PostInsta(imageName: "party"),
        PostInsta(imageName: "usa"),
        PostInsta(imageName: "verre"),
        PostInsta(imageName: "macaron"),
    ]
    @State var showSheet: Bool = false
    @State var selectedPostIndex: Int = 0
    
    var body: some View {
        VStack{
            HStack {
                Text("Publications")
                    .font(.title2)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 0))
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(0..<posts.count, id: \.self) { index in
                        Button {
                            selectedPostIndex = index
                            showSheet.toggle()
                        } label: {
                            Rectangle()
                                .aspectRatio(1, contentMode: .fit)
                                .overlay {
                                    GeometryReader { p in
                                        Image(posts[index].imageName)
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fill)
                                            .frame(width: p.size.width, height: p.size.height)
                                            .clipped()
                                        
                                    }
                                }
                            
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showSheet) {
            SheetInstaView(postInsta: posts[selectedPostIndex])
        }
    }
}

struct PostInstaView_Previews: PreviewProvider {
    static var previews: some View {
        PostInstaView()
    }
}

struct PostInsta {
    var id = UUID()
    var imageName: String = ""
    var numberOfLikes: Int = 0
    var numberOfMessages: Int = 0
    var description: String = ""
}

/*  put in the Content View for the whole Insta app:
 
 VStack {
     HeaderInstaView()
     StoryInstaView()
     PostInstaView()
 }
 
 */
