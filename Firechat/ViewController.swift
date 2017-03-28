//
//  ViewController.swift
//  Firechat
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var forgotBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.firebaseOrange
        emailField.placeholder = "email"
        passField.placeholder = "new password"
        let buttons = [loginBtn!,signupBtn!,logoutBtn!, forgotBtn!]
        buttons.forEach({viewFormatter.formatButton($0)})
        viewFormatter.formatLabel(errorLabel)
    }
   
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailField.text else {print ("bad email"); return}
        guard let pass = passField.text else {print ("bad pw"); return}
        FirebaseManager.login(email: email, password: pass, completion: {success, lblText in
            if success { print ("success"); self.animateLabel(shouldHide: false)}
            else {
                print ("failure")
                self.errorLabel.text = lblText
                self.animateLabel(shouldHide: true)
            }
        })
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        guard let email = emailField.text else {print ("bad email"); return}
        guard let pass = passField.text else {print ("bad pw"); return}
        FirebaseManager.signUp(email: email, password: pass, completion: {success, lblText in
            if success { print ("success"); self.animateLabel(shouldHide: false)}
            else {
                print ("failure")
                self.errorLabel.text = lblText
                self.animateLabel(shouldHide: true)
            }
        })
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        FirebaseManager.logOut(completion: { _ in
            self.emailField.text = nil
            self.passField.text = nil
            
        })
    }
    
    
    /*func testFields()-> Bool{
        let fields = [emailField,passField]
        var mayProcede = false
        fields.forEach({
            if ($0?.text) != nil {
                mayProcede = true
            }
        })
        return mayProcede
    }*/
    func animateLabel(shouldHide: Bool) {
        var alpha: CGFloat = 0
        if shouldHide{ alpha = 1 }
        UIView.animate(withDuration: 1.1, animations: {
            self.errorLabel.alpha = alpha
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let email = emailField.text ?? ""
        self.emailField.text = nil
        self.passField.text = nil
        self.errorLabel.alpha = 0
        guard let id = segue.identifier else {return}
        switch id {
        case "passSegue":
            guard let dest = segue.destination as? PassChangeViewController else {return}
            dest.email = email
            return
        default:
            return
        }
    }
}


extension UIColor {
    static let firebaseOrange = UIColor(red: 227/255, green: 89/255, blue: 65/255, alpha: 1)
}
