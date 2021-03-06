//
//  StopWatch.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 15/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import Foundation

class StopWatch {
    
    static let shared = StopWatch()
    
    private var seconds = Int()
    private var timer = Timer()
    private var isTimmerRunning = false
    private var pauzed = false
    
    private init () {
        self.seconds = Int()
        self.timer = Timer()
        self.isTimmerRunning = false
        self.pauzed = false
    }
    
    
    func start(seconds: Int) {
        
        self.seconds = seconds
    
        if self.isTimmerRunning == false {
            // Timer is not running
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
            
            self.isTimmerRunning = true
            
        }
        
        
    }
    
    func resumePause() {
        
        if self.pauzed {
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
            
            self.pauzed = false
            
        } else {

            self.timer.invalidate()
            self.pauzed = true
        }
        
    }
    
    func cancel() {
        self.isTimmerRunning = false
        self.timer.invalidate()
        self.timer = Timer()
        
    }
    
    @objc private func updateTimer() -> String {
        
        if seconds < 1 {
            //Send alert to indicate "time's up!"
            self.timer.invalidate()
            return "Time is up"
        } else {
            
            self.seconds -= 1
            print(self.timeString(time: TimeInterval(self.seconds)))
            
            return self.timeString(time: TimeInterval(self.seconds))
        }
    
        
    }
    
    private func timeString(time:TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    
}
