//
//  WelcomeViewController.swift
//  Workshop17
//
//  Created by Eden Mekonnen on 7/11/16.
//  Copyright © 2016 Eden Mekonnen. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    
    @IBOutlet var WelcomeUser: UILabel!
   
    @IBAction func logOutButtonTapped(sender: AnyObject) {
    NSUserDefaults.standardUserDefaults().removeObjectForKey("DrinkData")
    }
    let appdelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let TabBarController = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prefs: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        
        let name:String? = ""
        //<-- Here you should load a previously saved username
    
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
