//
//  mainViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 06/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import Firebase

class mainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    //MARK - outlets
    @IBOutlet weak var timerLabel: UILabel!
    
    
    // collectionview variabels
    let reuseIdentifier = "cell"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

    // timer variabels
    var seconds = 60
    var timer = Timer()
    var isTimmerRunning = false
    var resumeTapped = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("main")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionView
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    // MARK: - Actions
    
    @IBAction func startButton(_ sender: Any) {
        
        if isTimmerRunning == false {
            runTimer()
        } else if resumeTapped == true {
            runTimer()
        }
        
    }
    
    @IBAction func pauzeButton(_ sender: Any) {
        
        if resumeTapped == false {
            timer.invalidate()
            resumeTapped = true
        } else {
            runTimer()
            resumeTapped = false
        }
       
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        timer.invalidate()
        seconds = 0
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimmerRunning = false
        
    }
    
    // Mark: Functions
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(mainViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimmerRunning = true
        
    }
    
    func updateTimer() {
        
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate "time's up!"
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
        
    }
    
    func timeString(time:TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }

}

