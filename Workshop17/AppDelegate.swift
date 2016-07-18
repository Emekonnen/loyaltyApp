//
//  AppDelegate.swift
//  Workshop17
//
//  Created by Eden Mekonnen on 7/11/16.
//  Copyright © 2016 Eden Mekonnen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loginViewController = UINavigationController()
    var welcomeVC = UINavigationController()
    var coffeCardVC = UINavigationController()
    var tabBarController = UITabBarController()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let welcomeVC = WelcomeViewController(nibName:"WelcomeViewController",bundle:nil)
        welcomeVC.tabBarItem.title = "Home"
        welcomeVC.tabBarItem.image = UIImage(named:"home")
        
        let coffeeCardVC = CoffeeCardViewController(nibName:"CoffeeCardViewController",bundle:nil)
        coffeeCardVC.tabBarItem.title = "Coffee "
        coffeeCardVC.tabBarItem.image = UIImage(named:"coffee icon")
        
        let coffeeCompVC = CoffeeCompViewController(nibName:"CoffeeCompViewController",bundle:nil)
        coffeeCompVC.tabBarItem.title = "Coffee Rank"
        coffeeCompVC.tabBarItem.image = UIImage(named:"juice comp")
        
        let juiceCardVC = JuiceCardViewController(nibName:"JuiceCardViewController",bundle:nil)
        juiceCardVC.tabBarItem.title = "Juice"
        juiceCardVC.tabBarItem.image = UIImage(named:"juice icon")
        
        let juiceCompVC = JuiceCompViewController(nibName:"JuiceCompViewController",bundle:nil)
        juiceCompVC.tabBarItem.title = "Juice rank "
        juiceCompVC.tabBarItem.image = UIImage(named:"juice comp")
        
        
        self.tabBarController = UITabBarController()
        self.tabBarController.viewControllers = [welcomeVC,coffeeCardVC,coffeeCompVC,juiceCardVC,juiceCompVC]
        self.window?.rootViewController = self.tabBarController
    
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle:nil)
        
        self.loginViewController = UINavigationController(rootViewController: loginViewController)
        self.loginViewController.navigationBarHidden = true
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = self.loginViewController
        
        self.window?.makeKeyAndVisible()
        
        
        
        
        return true
        

        
        
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

}