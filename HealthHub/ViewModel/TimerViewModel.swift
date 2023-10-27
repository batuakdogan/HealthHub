//
//  TimerViewModel.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 27.10.2023.
//

import Foundation
class TimerViewModel {
    var currentTime: TimeInterval = 0 // Zamanlayıcı başlangıç süresi
    var timer: Timer?

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.currentTime += 1
            self.timerTick()
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    func resetTimer() {
            stopTimer()
            currentTime = 0
            timerTick() 
        }

    var timerTick: (() -> Void) = {}
}
