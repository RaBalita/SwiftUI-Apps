//
//  HeaderInstaView.swift
//  PracticeGenius
//
//  Created by Balita on 9/16/23.
//

import SwiftUI

struct HeaderInstaView: View {
    var body: some View {
        Grid {
            GridRow {
                ZStack {
                    Image("lion")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Text("2")
                        .frame(width: 30, height:30)
                        .background(.mint.opacity(0.9))
                        .clipShape(Circle())
                        .offset(x: 25, y: 25)
                }
                VStack {
                    Text("185").fontWeight(.bold)
                    Text("Publications").italic()
                }
                VStack {
                    Text("250").fontWeight(.bold)
                    Text("Abonnés").italic()
                }
                VStack {
                    Text("393").fontWeight(.bold)
                    Text("Abonnements").italic()
                }
            }
            
                VStack {
                    Text("Babality").fontWeight(.bold)
                    Text("Talk is sheep, show me the code.\nCode is meat. Lions eat meat.").italic()
                        .multilineTextAlignment(.center)
                }
            GridRow {
                Button("Modifier"){
                    
                }.buttonStyle(.borderedProminent)
                    .gridCellColumns(2)
                Button {
                    
                } label: {
                    Image(systemName: "person.badge.plus")
                        .font(.system(size: 30))
                    
                }
                .gridCellColumns(2)
            }
            Divider()
                .frame(height: 3)
                .overlay {
                    Color.accentColor
                }
           
        }
    }
}

struct HeaderInstaView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderInstaView()
    }
}


/*  put in the Content View for the whole Insta app:
 
 VStack {
     HeaderInstaView()
     StoryInstaView()
     PostInstaView()
 }
 
 */
