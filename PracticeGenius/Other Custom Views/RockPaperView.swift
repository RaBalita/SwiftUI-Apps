//
//  RockPaperView.swift
//  PracticeGenius
//
//  Created by Balita on 9/15/23.
//

import SwiftUI

struct RockPaperView: View {
    var itemWidth: CGFloat = 160
    @State var playerChoice: String = "scissors"
    @State var npcChoice: String = "rock"
    let choicesArray = ["paper", "rock", "scissors"]
    let winArray = ["youWin", "draw", "youLoose"]
    
    @State var isDraw: Bool = false
    @State var youWin: Bool = false
    @State var youLoose: Bool = false
    
    
    @State var timer: Timer?
    @State var isChoosing: Bool = false
    
    @State var nbPoints: Int = 0
    
    
    var body: some View{
        VStack{
            Text("| Rock | Paper | Scissors |")
                .font(.largeTitle)
            Divider()
            HStack{
                Image(playerChoice)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: itemWidth, height:itemWidth)
                Text("VS")
                    .frame(width: itemWidth / 2, height: itemWidth / 2)
                    .foregroundColor(.accentColor)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Image(npcChoice)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: itemWidth, height:itemWidth)
            }.padding( )
            Spacer()
            Text("Vos points: \(nbPoints)")
                .font(.title)
                .italic()
            Spacer()
            Button("Choisir") {
                isChoosing.toggle()
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }.onAppear {
            self.randomizeNpcChoice()
        }
        .confirmationDialog("A toi de choisir !", isPresented: $isChoosing){
            Button("Rock", role: .none){
                playerChoice = "rock"
                resolveMatch()
            }
            Button("Paper", role: .none){
                playerChoice = "paper"
                resolveMatch()
            }
            Button("Scissors", role: .none){
                playerChoice = "scissors"
                resolveMatch()
            }
        }
        .alert("Gagné !", isPresented: $youWin){
            Button("OK"){
                randomizeNpcChoice()
            }
        } message: {
            Text("winnnnnn")
        }
        .alert("Match nul !", isPresented: $isDraw){
            Button("OK"){
                randomizeNpcChoice()
            }
        } message: {
            Text("Nullllll")
        }
        .alert("☹︎ Perdu ... ☹︎", isPresented: $youLoose){
            Button("OK"){
                randomizeNpcChoice()
            }
        } message: {
            Text("☹︎☹︎☹︎☹︎☹︎☹︎☹︎☹︎☹︎☹︎☹︎")
        }
    }
    
    func randomizeNpcChoice() {
        isDraw = false
        youWin = false
        youLoose  = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { _ in
            npcChoice = choicesArray.randomElement()!
        })
    }
    
    func resolveMatch(){
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { _ in
            timer?.invalidate()
            checkWinner()
        })
    }
    
    func checkWinner(){
        if playerChoice == "rock" {
            if npcChoice == "rock" {
                isDraw = true
                
            }
            else if npcChoice == "scissors" {
                youWin = true
                nbPoints += 1
            } else {
                youLoose = true
                
            }
        }
        else if playerChoice == "scissors" {
            if npcChoice == "rock" {
                youLoose = true
                
            }
            else if npcChoice == "scissors" {
                isDraw = true
                
            } else {
                youWin = true
                nbPoints += 1
            }
            
        } else {
            if npcChoice == "rock" {
                youWin = true
                nbPoints += 1
            }
            else if npcChoice == "scissors" {
                youLoose = true
                
            } else {
                isDraw = true
                
            }
        }
    }
}


struct RockPaperView_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperView()
    }
}
