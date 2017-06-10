//
//  ActivityInfo.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 10/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import Foundation

// to store al info that is send to Firebase
struct ActivityInfo {
    
    static var activityInfo = ActivityInfo()
    
    var iconImage: String
    var iconLabel: String
    var todo: String
    var time: Int
    var feeling: String
    var haveDone: String
    
    init() {
        self.iconImage = String()
        self.iconLabel = String()
        self.todo = String()
        self.time = Int()
        self.feeling = String()
        self.haveDone = String()
    }
    
}
