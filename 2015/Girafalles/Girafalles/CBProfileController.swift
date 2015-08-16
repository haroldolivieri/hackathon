//
//  CBProfileController.swift
//  Girafalles
//
//  Created by Fabio Gois on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import UIKit

class CBProfileController: UIViewController {
    
    /* **************************************************************************************************
    **
    **  MARK: LoadNib
    **
    ****************************************************************************************************/
    
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
        NSBundle.mainBundle().loadNibNamed("CBProfileView", owner: self, options: nil)
    }
    
    /* **************************************************************************************************
    **
    **  MARK: ViewDidLoad
    **
    ****************************************************************************************************/

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /* **************************************************************************************************
    **
    **  MARK: IBOutlets
    **
    ****************************************************************************************************/
    
    @IBOutlet weak var pageView: UIView!
    
    /* **************************************************************************************************
    **
    **  MARK: IBActions
    **
    ****************************************************************************************************/
    
    @IBAction func buttonDirectMessage(sender: AnyObject)
    {
        // Code...
    }
    
    @IBAction func buttonCancel(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonQuit(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
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
