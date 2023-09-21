//
//  TimerView.swift
//  PracticeGenius
//
//  Created by Balita on 9/15/23.
//

import SwiftUI

struct TimerView: View {
    @State  var timeSpent = 0.0
    var TimeSpent: Double {
        return timeSpent
    }
    @State  var timer: Timer?
    @Binding  var isPlaying: Bool
    
    var body: some View {
     //   VStack(spacing: 30) {
            Text(String(format: "%.1f", timeSpent)).font(.largeTitle)
         /*   HStack(spacing: 40) {
                if (!isPlaying) {
                    Button{
                        startTimer()
                    } label : {
                        Image(systemName: "play.fill")
                    }.font(.largeTitle)
                    
                    Button{
                        if (timeSpent != 0.0) {
                            resetTimer()
                        }

                        } label : {
                            if (timeSpent != 0.0) {
                                Image(systemName: "eraser.line.dashed.fill")
                            }
                            else {
                                Image(systemName: "eraser")
                            }
                        }.font(.largeTitle)
                        .frame(width: 60)
                }
                
                else {
                    Button{
                        stopTimer()
                    } label : {
                        Image(systemName: "pause.fill")
                    }.font(.largeTitle)
                    
                    Button{
                        resetTimer()
                    } label : {
                        Image(systemName: "stop.fill")
                    }.font(.largeTitle)
                        .frame(width: 60)
                }
                
            }*/
        }
       
      //  }
    
    
    func startTimer(){
        print("Start Timer °°°°°°°°°°°°°")
        if (!isPlaying) {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { i in
                self.timeSpent += 0.1
            })
            isPlaying = true
        }
    }
    
    func stopTimer(){
        timer?.invalidate()
        isPlaying = false
    }
    
    func resetTimer(){
        stopTimer()
        timeSpent = 0
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(isPlaying: .constant(false))
    }
}
