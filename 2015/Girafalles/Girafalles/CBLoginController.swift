//
//  CBLoginController.swift
//  Girafalles
//
//  Created by Fabio Gois on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class CBLoginController: UIViewController, FBSDKLoginButtonDelegate
{
    
    @IBOutlet weak var facebookButton: FBSDKLoginButton!
    /* **************************************************************************************************
    **
    **  MARK: LoadNib
    **
    ****************************************************************************************************/
    
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
        NSBundle.mainBundle().loadNibNamed("CBLoginView", owner: self, options: nil)
    }

    /* **************************************************************************************************
    **
    **  MARK: ViewDidLoad
    **
    ****************************************************************************************************/
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        facebookButton.readPermissions = ["public_profile", "email", "user_friends"]
        facebookButton.center = self.view.center
        facebookButton.delegate = self

        // Do any additional setup after loading the view.
    }
    
    /* **************************************************************************************************
    **
    **  MARK: IBActions
    **
    ****************************************************************************************************/
    
//    @IBAction func buttonfacebook(sender: AnyObject)
//    {
//        // Code
//        performSegueWithIdentifier("toRegister", sender: nil)
//    }
    
    // MARK: - Facebook Login
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if error == nil
        {
            println("Login complete.")
            
            let facebookRequest = FBSDKGraphRequest(graphPath: "me?fields=id,first_name,last_name,email,picture", parameters: nil)
            facebookRequest.startWithCompletionHandler({
                (connection, result, error: NSError!) -> Void in
                if error == nil {
                    println("\(result)")
                    
                    var facebookID = result["id"] as! String
                    var interesses: [String] = ["programação", "música"]
                    let avatarLocation = "https://graph.facebook.com/\(facebookID)/picture?width=640&height=640"
                    var user = User(id: "", facebookID: facebookID, name: result["first_name"] as! String, surname: result["last_name"] as! String, telephone : "", photoURL: avatarLocation, interestsAndSkill:interesses)
                    
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setValue(facebookID, forKey: "facebookID")
                    
                    self.performSegueWithIdentifier("toRegister", sender: self)
                    
                    UserDAO.saveUser(user, callback: { success in
                        println(success)
                    })
                    
                } else {
                    println("\(error)")
                }
            })
            
            
           
        }
        else
        {
            println(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        println("User logged out...")
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
