//
//  CBRegisterController.swift
//  Girafalles
//
//  Created by Fabio Gois on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import UIKit
import AMTagListView
import FBSDKCoreKit
import FBSDKLoginKit

class CBRegisterController: UIViewController, AMTagListDelegate, UITextFieldDelegate, UIAlertViewDelegate
{
    
    /* **************************************************************************************************
    **
    **  MARK: IBOutlets
    **
    ****************************************************************************************************/
    
    @IBOutlet weak var facebookImage: UIImageView!
    @IBOutlet weak var facebookName: UILabel!
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var formLabels: UITextField!
    var tagListView : CBTagRegisterView!
    var tagToDelete : AMTagView!
    
    
    /* **************************************************************************************************
    **
    **  MARK: LoadNib
    **
    ****************************************************************************************************/
    
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
        NSBundle.mainBundle().loadNibNamed("CBRegisterView", owner: self, options: nil)
    }
    
    /***************************************************************************************************
    **
    **  MARK: ViewDidLoad
    **
    ****************************************************************************************************/

    override func viewDidLoad()
    {
        super.viewDidLoad()
        formLabels.delegate = self
        tagListView = CBTagRegisterView(parentView: tagView)
        tagListView.tagList.tagListDelegate = self
        tagListView.tagList.setTapHandler { tag in
            self.tagToDelete = tag
            SDUIUtils.instance.showTwoOptionsAlert("Deletar Interesse", message: "Deseja deletar o interesse " + tag.tagText() + "?", delegate: self)
            
            self.facebookName.text = "Haroldo Olivieri"
            
            let imageName = "haroldo.jpg"
            let image = UIImage(named: imageName)
            self.facebookImage = UIImageView(image: image!)
            
        }
        // Do any additional setup after loading the view.
    }
    
    /**
    *   Chamado quando o o alert de erro é clicado em OK, para deletar tag
    */
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == 1){
            tagListView.tagList.removeTag(tagToDelete)            
        }

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        tagListView.tagList.addTag(textField.text)
        textField.text = ""
        return true
    }
    
    /* **************************************************************************************************
    **
    **  MARK: IBActions
    **
    ****************************************************************************************************/
    
    @IBAction func buttonCancel(sender: AnyObject)
    {
        self.performSegueWithIdentifier("toLogin", sender: self)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue("", forKey: "facebookID")

    }
    
    @IBAction func buttonDone(sender: AnyObject)
    {
        self.performSegueWithIdentifier("toHome", sender: self)
    }
    
    
    func tagList(tagListView: AMTagListView!, shouldAddTagWithText text: String!, resultingContentSize size: CGSize) -> Bool {
            return true
    }

}
