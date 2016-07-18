//
//  CoffeeCardViewController.swift
//  Workshop17
//
//  Created by Eden Mekonnen on 7/11/16.
//  Copyright © 2016 Eden Mekonnen. All rights reserved.
//

import UIKit

class CoffeeCardViewController: UIViewController {

    @IBAction func coffeeButtonsPressed(sender: AnyObject) {
        sender.setImage(UIImage(named: "x mark"), forState: .Normal)
    }
    @IBAction func freeCoffeeButtonPressed(sender: AnyObject) {
        sender.setImage(UIImage(named: "free sign"), forState: .Normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
