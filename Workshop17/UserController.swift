//
//  UserController.swift
//  Workshop17
//
//  Created by Eden Mekonnen on 7/14/16.
//  Copyright © 2016 Eden Mekonnen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct User {
    var email: String
    var password: String
    var token:String
    var client:String
    
    //default contructor
    init(email:String, password:String, token:String, client:String)  {
        self.email = email
        self.password = password
        self.token = token
        self.client = client
    }
    
    //constructor from JSON
    init(json:JSON)  {
        //        print("json init")
        self.email = json["email"].stringValue
        self.client = json["client"].stringValue
        self.token = json["token"].stringValue
        self.password = json["password"].stringValue
        
    }
    
}


class UserController: WebService {
    
    class var sharedInstance: UserController {
        struct Static {
            static var instance:UserController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)    {
            Static.instance = UserController()
        }
        return Static.instance!
    }
    
    
    var logged_in_user: User?
    
    
    func registerUser(email:String, password:String, presentingViewController:UIViewController? = nil, viewControllerCompletionFunction:(User?,String?) -> ()) {
        
        let user = ["email":email,"password":password]
        
        let request = self.createMutableAnonRequest(NSURL(string: "http://my.open.co.za:3006/coffee"), method: "POST", parameters: user)
        
        self.executeRequest(request, LoginViewController:presentingViewController, requestCompletionFunction: {(responseCode, json) in
            
            print( json)
            var user:User = User(email: "", password: "",token:"", client: "")
            
            
            if (responseCode / 100 == 2)   {
                user = User(email: json["data"]["email"].stringValue,password:"not_given_and_not_stored",token:json["data"]["token"].stringValue,client:"||")
                
                
                //Persist
                self.storeUser(user)
                self.setLoggedInUser(user)
                self.logged_in_user = user
                
                viewControllerCompletionFunction(user,nil)
            }   else    {
                //the web service to create a user failed. Lets extract the error message to be displayed
                
                let errorMessage = json["errors"]["full_messages"][0].stringValue
                
                //execute the closure in the ViewController
                viewControllerCompletionFunction(nil,errorMessage)
            }
            
            
            //Not that our registerUser function 4 parameters: email, password, presentingViewController and completion
            //completion is a closure for what is to happen in the ViewController when we are done with the webservice.
            //lets go back to that closure now
            viewControllerCompletionFunction(user,nil)
        })
        
        //we are now done with the registerUser function. Note that this function doesnt return anything. But because of the viewControllerCompletionFunction closure we are given as an input parameter, we can set in motion a function in the calling class when it is needed.
        
    }
    
    
    //MARK:- User Persistence Functions
    func storeUser(user:User)    {
        
        let userDict = ["email":user.email, "token":user.token, "password":user.password,"client":user.client]
        NSUserDefaults.standardUserDefaults().setObject(userDict, forKey:user.email)
        
        
    }
    
    func setLoggedInUser(user:User)    {
        
        NSUserDefaults.standardUserDefaults().setObject(user.email, forKey: "loggedInUser")
        
    }
    
    func getLoggedInUser()  -> User?    {
        
        if let userId = NSUserDefaults.standardUserDefaults().stringForKey("loggedInUser")    {
            //a user is logged in, return the User object for this user id
            return self.getStoredUser(userId)
        }   else    {
            //else user not found
            return nil
        }
        
    }
    
    func getStoredUser(id:String) -> User?    {
        
        if let userDict:Dictionary = NSUserDefaults.standardUserDefaults().objectForKey(id) as? Dictionary<String, String>   {
            //user found
            let user = User(email: id, password: userDict["password"]!, token: userDict["token"]!, client:userDict["client"]!)
            
            return user
        }   else    {
            //else user not found
            return nil
        }
        
    }
}