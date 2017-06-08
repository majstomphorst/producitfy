//
//  MainViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 06/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import Firebase

struct IconInfo {
    let icon: String
    let label: String
    
    init(withicon icon: String, label: String) {
        self.icon = icon
        self.label = label
    }
}


// to store al info that is send to Firebase
struct ActivityInfo {
    let iconInfo: IconInfo
    let todo: String
    let time: Int //????
    var feeling: String
    var haveDone: String
    
    init(withiconInfo iconInfo: IconInfo, todo: String, time: Int) {
        self.iconInfo = iconInfo
        self.todo = todo
        self.time = time
        self.feeling = String()
        self.haveDone = String()
    }
    
    mutating func completing(feeling: String, haveDone: String){
        self.feeling = feeling
        self.haveDone = haveDone
    }
    
}


class MainViewController: UIViewController {
    
    
    //MARK - Outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timePicker: UIPickerView!
    
    var iconInfo = [IconInfo]()
    
    // picker view
    var rotationPicker = CGFloat ()
    
    
    // collectionview variabels
    let reuseIdentifier = "cell"
    var items = [10 , 20, 30, 40, 50, 60, 70]
    
    var time = ["1 min": 60]

    // timer variabels
    var seconds = Int()
    var timer = Timer()
    var isTimmerRunning = false
    var resumeTapped = false
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        do {
            try Auth.auth().signOut()
            
            // if error this send a alert to the user with the reason why
        } catch {
            alertUser(title: "logout went wrong", message: error.localizedDescription)
        }
        
        
        if let userId = Auth.auth().currentUser?.uid {
            print("nono")
            print(userId)
        } else {
            print("hello")
            performSegue(withIdentifier: "signinSegue", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconInfo.append(IconInfo(withicon: "0", label: "label0"))
        iconInfo.append(IconInfo(withicon: "1", label: "label1"))
        iconInfo.append(IconInfo(withicon: "2", label: "label2"))
        iconInfo.append(IconInfo(withicon: "3", label: "label3"))
        iconInfo.append(IconInfo(withicon: "4", label: "label4"))
        iconInfo.append(IconInfo(withicon: "5", label: "label5"))
        iconInfo.append(IconInfo(withicon: "6", label: "label6"))
        
        
//        rotationPicker = 90 * (.pi / 180)
//        timePicker.transform = CGAffineTransform(rotationAngle: rotationPicker)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    
    @IBAction func startButton(_ sender: Any) {
        
        if isTimmerRunning == false {
            runTimer()
            isTimmerRunning = true
        } else if resumeTapped == true {
            runTimer()
            isTimmerRunning = true
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
        
        isTimmerRunning = false
        timer.invalidate()
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
    }
    
    // Mark: Functions
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(MainViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimmerRunning = true
        
    }
    
    func updateTimer() {
        
        if seconds < 1 {
            performSegue(withIdentifier: "conformationSegue", sender: nil)
             //Send alert to indicate "time's up!"
            timer.invalidate()
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

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UICollectionView
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.iconInfo.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.iconImage.image = UIImage(named: iconInfo[indexPath.item].icon)
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = iconInfo[indexPath.item].label
        return cell
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
      
        print("You selected cell #\(indexPath.item)!")
        
    }
    
}

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ("\(items[row]) Seconds")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seconds = items[row]
    }
    
    
}

