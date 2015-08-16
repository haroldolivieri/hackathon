//
//  AppDelegate.swift
//  Girafalles
//
//  Created by Renan Almeida on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool
    {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    
    func application (application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        // Enables Local Datastore
        Parse.enableLocalDatastore()
        
        // Initializes Parse
        Parse.setApplicationId("QPkDu02DU88I1gTL3Z0LhpKUHS6NA2bsd2k0gHCa", clientKey: "nlDbJSkagmeTB0SDXmQHokjzZB10DadQD4Av31Rz")
        PFUser.enableRevocableSessionInBackground()

        // Facebook Utils
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        
        // Tracks statistics around application opens
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        Application.instance
        
        let prefs = NSUserDefaults.standardUserDefaults()
        var userFacebookID = prefs.stringForKey("facebookID")
        
        if (userFacebookID != nil)
        {
           
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            var initialViewController = storyboard.instantiateViewControllerWithIdentifier("mapView") as! CBMapController
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            
        }
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    
    

    
    func applicationWillResignActive (application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    
    func applicationDidEnterBackground (application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    
    func applicationWillEnterForeground (application: UIApplication)
    {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    
    func applicationDidBecomeActive (application: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        FBSDKAppEvents.activateApp()
    }

    
    func applicationWillTerminate (application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


