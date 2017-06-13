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
    
//    func getImg() -> UIImage {
//        
//        
//        return UIImage
//    }
//    
//    func getLabel() -> String {
//        
//        return UIImage
//    }
}

class MainViewController: UIViewController {
    
    //MARK - Outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var activityCollection: UICollectionView!
    @IBOutlet weak var todoText: UITextField!
    
    var iconInfo = [IconInfo]()
    
    // collectionview variabels
    let reuseIdentifier = "cell"
    
    // timer variabels
    var seconds = Int()
    var timer = Timer()
    var isTimmerRunning = false
    var resumeTapped = false
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        // check if user is signin or not
        if let userId = Auth.auth().currentUser?.uid {
            print(userId)
        } else {
            print("hello")
            performSegue(withIdentifier: "signinSegue", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let uid = Auth.auth().currentUser?.uid {
            
            
            Database.database().reference().child("preferene").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                print("find me!")
                print(snapshot)
                
                print("find me!02")
                print(snapshot.key)
            
                if let imagdict = snapshot.value as? Dictionary<String, String> {
                    print(imagdict.keys)
                    
                    for key in imagdict.keys {
                        
                        self.iconInfo.append(IconInfo(withicon: imagdict[key]!, label: key))
                    }
                    self.activityCollection.reloadData()
                    
                    
                }
            })
            
            
        }
        
        
        

//        iconInfo.append(IconInfo(withicon: "0", label: "label0"))
//        iconInfo.append(IconInfo(withicon: "1", label: "label1"))
//        iconInfo.append(IconInfo(withicon: "2", label: "label2"))
//        iconInfo.append(IconInfo(withicon: "3", label: "label3"))
//        iconInfo.append(IconInfo(withicon: "4", label: "label4"))
//        iconInfo.append(IconInfo(withicon: "5", label: "label5"))
//        iconInfo.append(IconInfo(withicon: "6", label: "label6"))
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // MARK: - Actions
    @IBAction func returnToMainView(segue: UIStoryboardSegue) {}
    
    
    @IBAction func logOutButton(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            
            performSegue(withIdentifier: "signinSegue", sender: nil)
            
            // if error this send a alert to the user with the reason why
        } catch {
            alertUser(title: "logout went wrong", message: error.localizedDescription)
        }
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        seconds = Int(timePicker.countDownDuration)
        ActivityInfo.activityInfo.time = seconds
        print(todoText.text!)
        ActivityInfo.activityInfo.todo = todoText.text!
        
        
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
        
        let url = URL(string: iconInfo[indexPath.row].icon)
        
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            
            if error == nil {
                // on the main thread
                DispatchQueue.main.async {
                    print("??")
                    // Assigning image data to Image placeholder
                    cell.iconImage.image = UIImage(data: data!)
                    
                }
            }
        }
        task.resume()
        
        
        // cell.iconImage.image = UIImage(named: iconInfo[indexPath.item].icon)
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = iconInfo[indexPath.item].label
        
        return cell
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap event
        ActivityInfo.activityInfo.iconImage = "\(indexPath.row)"
        ActivityInfo.activityInfo.iconLabel = "\(indexPath.row)"
        
        
        print("You selected cell #\(indexPath.item)0!")
        
        
    }
    
}

