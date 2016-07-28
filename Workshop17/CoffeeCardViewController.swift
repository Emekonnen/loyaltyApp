//
//  CoffeeCardViewController.swift
//  Workshop17
//
//  Created by Eden Mekonnen on 7/11/16.
//  Copyright © 2016 Eden Mekonnen. All rights reserved.
//

import UIKit

class CoffeeCardViewController: UIViewController {
    
    var numCoffees:Int? = 0
    
    func updateSavedCount() {
        
        if numCoffees == nil {
            return
        }
        
        if var existingData = NSUserDefaults.standardUserDefaults().dictionaryForKey("DrinkData") {
            existingData["coffees"] = numCoffees! as NSNumber
            NSUserDefaults.standardUserDefaults().setObject(existingData, forKey: "DrinkData")
        }
    }
    
    
    @IBOutlet var coffeeButtons: [UIButton]!
    @IBOutlet var freeCoffee: UIButton!    
    @IBAction func coffeeButtonsPressed(sender: AnyObject) {
        sender.setImage(UIImage(named: "x mark"), forState: .Normal)
        numCoffees? -= 1
        updateSavedCount()
    }
    
    @IBAction func freeCoffeeButtonPressed(sender: AnyObject) {
        sender.setImage(UIImage(named: "free sign"), forState: .Normal)
        numCoffees? = 0
        updateSavedCount()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedData = NSUserDefaults.standardUserDefaults().dictionaryForKey("DrinkData") {
            
            numCoffees = loadedData["coffees"] as? Int
            print(numCoffees)
            //PLACE CODE HERE
            for i in 0..<numCoffees! {
                if i >= coffeeButtons?.count {
                    break
                }
                let button = coffeeButtons[i]
                button.enabled = true
            }
            if numCoffees >= coffeeButtons.count {
                freeCoffee?.enabled = true
            }
        }
        
    }
    
//        //make the web service response set the value of numCoffees
//        //for view in self.view.subviews {
//            //if let button = view as? UIButton    {
//                //if (numCoffees > button.tag) {
//                    
//                //the view object is of type UIButton! this means we have a button object\
//                
//                }
//                
//                if (numCoffees == button.tag) {
//                    button.enabled = true
//                    
//                    
//                    //this is the button afer the num of coffees. it should be tapped
//                   
//                }
//                
//                if (numCoffees > button.tag) {
//                    
//                    //if the button tag is larger than the num of coffees
//                    button.enabled = true
//                
//                }
//        }
//
//        let tagOfNextButton = numCoffees
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  }

}