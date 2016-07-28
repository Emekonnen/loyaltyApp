//
//  JuiceCardViewController.swift
//  Workshop17
//
//  Created by Eden Mekonnen on 7/11/16.
//  Copyright © 2016 Eden Mekonnen. All rights reserved.
//

import UIKit

class JuiceCardViewController: UIViewController {

    @IBOutlet var juiceButtons: [UIButton]!
    @IBOutlet var freeJuice: UIButton!
    
    var numJuices:Int? = 0
    
    func updateSavedCount() {
        
        if numJuices == nil {
            return
        }
        
        if var existingData = NSUserDefaults.standardUserDefaults().dictionaryForKey("DrinkData") {
            existingData["juices"] = numJuices! as NSNumber
            NSUserDefaults.standardUserDefaults().setObject(existingData, forKey: "DrinkData")
        }
    }
    

    @IBAction func juiceButtonsPressed(sender: AnyObject) {
        sender.setImage(UIImage(named: "x mark"), forState: .Normal)
        numJuices? -= 1
        updateSavedCount()

    }
    
    @IBAction func freeButtonPressed(sender: AnyObject) {
        sender.setImage(UIImage(named: "free sign"), forState: .Normal)
        numJuices? = 0
        updateSavedCount()
    
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let loadedData = NSUserDefaults.standardUserDefaults().dictionaryForKey("DrinkData") {
            
            numJuices = loadedData["juices"] as? Int
            print(numJuices)
            //PLACE CODE HERE
            for i in 0..<numJuices! {
                if i >= juiceButtons?.count {
                    break
                }
                let button = juiceButtons[i]
                button.enabled = true
            }
            if numJuices >= juiceButtons.count {
                freeJuice?.enabled = true
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}