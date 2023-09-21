//
//  StrangerBookView.swift
//  PracticeGenius
//
//  Created by Balita on 9/16/23.
//

import SwiftUI

struct StrangerBookView: View {
    @Binding var data: Data
    var mainColor:Color = .orange
    
    var body: some View {
        VStack {
            Text("Strangers Book")
                .font(.custom("CorpusGaiiCaps", fixedSize: 45))
            ScrollView {
                
                ForEach(data.posts.indices, id: \.self) { i in
                    VStack {
                        HStack (alignment: .bottom) {
                            Image(data.posts_users[i].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                            Text(data.posts_users[i].name)
                                .font(.custom("CorpusGaiiCaps", fixedSize: 20))
                                .foregroundColor(mainColor)
                            Spacer()
                        }
                        
                        Divider()
                            .frame(height: 3)
                            .overlay(mainColor)
                        
                        Image(data.posts[i].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300)
                        Text(data.posts[i].text)
                        Divider()
                            .frame(height: 3)
                            .overlay(mainColor)
                        HStack (alignment: .lastTextBaseline) {
                            
                            data.posts[i].didLike == true ?
                            Image(systemName: "heart.fill")
                                .foregroundColor(mainColor)
                            :
                            Image(systemName: "heart")
                                .foregroundColor(mainColor)
                            Text("\(data.posts[i].numberOfLikes) Likes")
                                .foregroundColor(mainColor)
                            
                            Spacer()
                            Image(systemName: "message")
                                .foregroundColor(mainColor)
                            data.posts[i].numberOfMessages <= 1 ?
                            Text("\(data.posts[i].numberOfMessages) Message")
                                .foregroundColor(mainColor)
                            :
                            Text("\(data.posts[i].numberOfMessages) Messages")
                                .foregroundColor(mainColor)
                        }
                        
                    }
                    .padding(EdgeInsets(top: 15, leading: 15, bottom:15, trailing: 15))
                    .background (
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(mainColor, style: StrokeStyle(lineWidth: 0.8))
                    )
                    .padding()
                }
                
                
            }
        }
    }
}

struct StrangerBookView_Previews: PreviewProvider {
    static var previews: some View {
        StrangerBookView(data: .constant(Data()))
    }
}


struct User : Identifiable {
    var id = UUID()
    var name:String
    var imageName: String
    var posts: [Post] = [Post]()
    
    var postsCount: Int {
        return posts.count
    }
    
    mutating func AddPost(post: Post){
        posts.append(post)
    }
}

struct Post : Identifiable {
    var id = UUID()
    var text:String
    var imageName: String
    var likers: [User]
    var numberOfLikes: Int // devrait être calculé à partir de Post.likers
    var numberOfMessages: Int
    var didLike: Bool
    
    mutating func AddLiker(liker: User){
        likers.append(liker)
    }
}

struct Data {
    
    var post_0 = Post(
        text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. \nDuis aute irure dolor in reprehenderit in voluptate velit esse  cillum dolore eu fugiat nulla pariatur.  ",
        imageName: "bats",
        likers: [],
        numberOfLikes: 56,
        numberOfMessages: 11,
        didLike: false)
    
    var post_1 = Post(
        text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod ",
        imageName: "crush",
        likers: [],
        numberOfLikes: 56,
        numberOfMessages: 11,
        didLike: true)
    
    var post_2 = Post(
        text: "Duis aute irure dolor in reprehenderit in voluptate velit esse  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageName: "father",
        likers: [],
        numberOfLikes: 14,
        numberOfMessages: 0,
        didLike: false)
    
    var post_3 = Post(
        text: "Duis aute irure dolor in reprehenderit in voluptate velit esse  cillum dolore eu fugiat nulla pariatur. ",
        imageName: "fireworks",
        likers: [],
        numberOfLikes: 14,
        numberOfMessages: 3,
        didLike: false)
    
    
    var post_4 = Post(
        text: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageName: "grass",
        likers: [],
        numberOfLikes: 14,
        numberOfMessages: 1,
        didLike: true)
    
    var post_5 = Post(
        text: "Duis aute irure dolor in reprehenderit in voluptate velit esse  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageName: "marine",
        likers: [],
        numberOfLikes: 14,
        numberOfMessages: 3,
        didLike: true)
    
    
    let eddie = User(name: "Eddie", imageName: "eddie")
    let lucas = User(name: "Lucas", imageName: "lucas")
    let eleven = User(name: "Eleven", imageName: "eleven")
    
    var posts_users: [User] {
        return [eddie, lucas, eleven, eleven, eddie, eddie]
    }
    
    var posts: [Post]{
        return [post_0, post_1, post_2, post_3, post_4, post_5]
    }
    
    
}
