//
//  AppDelegate.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/15/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit
import Google
import GoogleSignIn

var userId = ""
var idToken = ""
var fullName = ""
var givenName = ""
var familyName = ""
var email = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    // Includes code for Google Auth setup
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Initialize sign-in
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    // Also for Google Auth
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations on signed in user here.
        userId = user.userID                    // For client-side use only!
        idToken = user.authentication.idToken   // Safe to send to the server
        fullName = user.profile.name
        givenName = user.profile.givenName
        familyName = user.profile.familyName
        email = user.profile.email
        
        print("Google authenticated user successfully")
        
        print("------------------------")
        print("KYLE: userId = \(userId)")
        print("KYLE: fullName = \(fullName)")
        print("KYLE: givenName = \(givenName)")
        print("KYLE: familyName = \(familyName)")
        print("KYLE: email = \(email)")
        print("------------------------")
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
