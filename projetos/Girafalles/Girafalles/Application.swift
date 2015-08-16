//
//  Application.swift
//  Girafalles
//
//  Created by Renan Almeida on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import Foundation
import Parse

// Singleton
class Application
{
    /* **************************************************************************************************
    **
    **  MARK: Public
    **
    ****************************************************************************************************/

    private(set) var appUser: User!
    
    
    /* **************************************************************************************************
    **
    **  MARK: Singleton Pattern
    **
    ****************************************************************************************************/
    
    static var instance: Application {
        if (singletonInstance == nil) {
            singletonInstance = Application()
        }
        return singletonInstance
    }

    private static var singletonInstance: Application!
    
    private init ()
    {
        UserDAO.readUser("n1w9eaKh7A") { user in
            if (user != nil) {
                self.appUser = user!
                // Redireciona pra Mapa
            } else {
                // Redireciona pra Login
            }
        }
    }
}


