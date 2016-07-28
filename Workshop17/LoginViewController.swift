//
//  LoginViewController.swift
//  Workshop17
//
//  Created by Eden Mekonnen on 7/11/16.
//  Copyright © 2016 Eden Mekonnen. All rights reserved.
//

import UIKit
import SwiftyJSON


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var emailField: UITextField!
    
    var window: UIWindow?
    
    let appdelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var data : NSMutableData = NSMutableData()
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        let email = self.emailField.text!
        let password = self.passwordField.text!
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.window?.rootViewController = appDelegate.tabBarController
        let url: NSURL = NSURL(string: "http://my.open.co.za:3006/coffee")!
        let loginString = NSString(format: "%@:%@", email, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64EncodedCredential = loginData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        let authString = "Basic \(base64EncodedCredential)"
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.HTTPAdditionalHeaders = [ "Authorization": authString ]
        let session = NSURLSession(configuration: config)
        
        var running = false
        let task = session.dataTaskWithURL(url) {
            (let data, let response, let error) in
            if let httpResponse = response as? NSHTTPURLResponse {
                
                do {
                    
                    let drinkData = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String:AnyObject]
                    print(drinkData)
                    NSUserDefaults.standardUserDefaults().setObject(drinkData, forKey: "DrinkData")
                    
                } catch let error as NSError {
                    
                    print("Error: \(error.localizedDescription)")
                }
                //let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                //print(dataString)
                
                
            }
            running = false
        }
        
        running = true
        task.resume()
        
        while running {
            print("waiting...")
            sleep(1)
        }
    }

    func connection(didRecieveResponse: NSURLConnection!, didRecieveResponse response: NSURLResponse) {
        self.data = NSMutableData()
        NSLog("Reset data")
    }

    func connection(connection: NSURLConnection!, didReceive data: NSData!) {
        self.data.appendData(data)
        NSLog("Part \(self.data)")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        NSLog("Finished loading \(self.data)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */