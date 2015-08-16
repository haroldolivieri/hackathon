//
//  SDUIUtils.swift
//  Girafalles
//
//  Created by Haroldo Olivieri on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//
import Foundation

class SDUIUtils {
    
    // Private constructor
    private init (){
        // TODO: Load all entities, enemies and characters once
    }
    
    private struct Singleton {
        static var Instance: SDUIUtils!
    }
    
    class var instance: SDUIUtils {
        if (Singleton.Instance == nil) {
            Singleton.Instance = SDUIUtils()
        }
        return Singleton.Instance
    }
    
    /**
    *  Habilita ou desabilita itens da view
    *
    *  :param: enable `Bool` que define o estado do elemento
    *
    *  :param: view `UIView` do controller que chamou o método
    *
    *  :returns: `void`
    */
    private func enableDisableUIView(enable : Bool, view : UIView){
        var subviews = view.subviews
        
        if subviews.count > 0 {
            for subview in subviews{
                if var view = subview as? UIButton {
                    (subview as! UIButton).enabled = enable
                }
                
                //                else if var view = subview as? UIActivityIndicatorView {
                //                    if (!enable){
                //                        (subview as! UIActivityIndicatorView).startAnimating()
                //                    } else{
                //                        (subview as! UIActivityIndicatorView).stopAnimating()
                //                    }
                //
                //                }
                
            }
        }
    }
    
    /**
    *  Mostra loading com mensagem e bloqueia a interação com os botões da tela
    *
    *  :param: message mensagem que aparecerá com o loading
    *
    *  :param: view `UIView` do controller que chamou o método
    *
    *  :returns: `void`
    */
    func showLockedLoading(message : String, view : UIView){
        enableDisableUIView(false, view: view)
        SDUIUtils.instance.showLoading(view, msg: message, indicator: true)
    }
    
    /**
    *  Apaga loading com mensagem e desbloqueia a interação com os botões da tela
    *
    *  :param: view `UIView` do controller que chamou o método
    *
    *  :returns: `void`
    */
    func dismissLockedLoading(view : UIView){
        enableDisableUIView(true, view: view)
        SDUIUtils.instance.loadingFrame.removeFromSuperview()
    }
    
    
    func showSimpleAlert(title : String, message : String){
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func showSimpleAlert(title : String, message : String, delegate : UIAlertViewDelegate?){
        let alert = UIAlertView()
        alert.title = title
        alert.delegate = delegate
        alert.message = message
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func showTwoOptionsAlert(title : String, message : String, delegate : UIAlertViewDelegate?){
        let alert = UIAlertView()
        alert.title = title
        alert.delegate = delegate
        alert.message = message
        alert.addButtonWithTitle("Cancel")
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func showTextAlert(title : String, message : String, placeholder : String, delegate : UIAlertViewDelegate?){
        let alert = UIAlertView()
        alert.title = title
        alert.delegate = delegate
        alert.message = message
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        
        var alertTextField = alert.textFieldAtIndex(0)
        alertTextField!.placeholder = placeholder
        
        alert.addButtonWithTitle("Cancel")
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    var loadingFrame = UIView()
    var strLabel : UILabel!
    
    func showLoading(view : UIView, msg : String, indicator : Bool){
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 150, height: 50))
        strLabel.textAlignment = .Center
        strLabel.text = msg
        strLabel.textColor = UIColor.whiteColor()
        
        loadingFrame = UIView(frame: CGRect(x: 0 , y: 0, width: view.frame.width*0.6, height: view.frame.height*0.08))
        loadingFrame.center.x = view.center.x
        loadingFrame.center.y = view.center.y
        
        loadingFrame.layer.cornerRadius = 15
        loadingFrame.backgroundColor = UIColor(white: 0, alpha: 0.8)
        
        if indicator {
            var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.startAnimating()
            loadingFrame.addSubview(activityIndicator)
        }
        
        loadingFrame.addSubview(strLabel)
        view.addSubview(loadingFrame)
        
    }
    
    
}