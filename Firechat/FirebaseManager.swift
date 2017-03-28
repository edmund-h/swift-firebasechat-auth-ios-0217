//
//  FirebaseManager.swift
//  Firechat
//
//  Created by Johann Kerr on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseManager {
    
    class func login(email: String, password: String, completion: @escaping (Bool,String)-> ()) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { user, error in
            if let error = error {
                let text = error.localizedDescription
                completion(false, text)
            }
            else {completion(true, "")}
        })
    }
    
    class func signUp(email: String, password: String, completion: @escaping (Bool,String)-> ()) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { user, error in
            if let error = error {
                let text = error.localizedDescription
                completion(false, text)
            }
            else {completion(true, "")}
        })
    }
    
    class func logOut(completion: @escaping (Bool)->()) {
        let signedOut = try? FIRAuth.auth()?.signOut()
        if signedOut == nil {print ("error logging out")}
        completion(true)
    }
    
    class func changePassword(email: String, newPassword: String, completion: @escaping (Bool, String)-> ()) {
        print("doing a thing")
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { msg in
            print(msg.debugDescription)
            completion(false, "")
        })

    }
}

