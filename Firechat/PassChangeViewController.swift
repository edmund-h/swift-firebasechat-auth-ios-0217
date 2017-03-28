//
//  PassChangeViewController.swift
//  Firechat
//
//  Created by Edmund Holderbaum on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class PassChangeViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var verifyField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    var email: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.firebaseOrange
        self.title = "Forgot Password"
        // Do any additional setup after loading the view.
        emailField.placeholder = "email"
        if let emailText = email { emailField.text = emailText }
        passField.placeholder = "new password"
        verifyField.placeholder = "verify new password"
        viewFormatter.formatButton(submitBtn)
        //submitBtn.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        print("yo dawg")
        if checkFields(){
            if let email = emailField.text, let password = passField.text{
                FirebaseManager.changePassword(email: email, newPassword: password, completion: { success, response in
                    print (response)
                })
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func checkFields()-> Bool {
        var mayProcede = true
        var text = ""
        print("sup dawg")
        [emailField!,passField!,verifyField!].forEach{
            if $0.text == nil {
                mayProcede = false
                text = "Please fill out each field. "
            }
        }
        if passField.text != verifyField.text{
            mayProcede = false
            text.append("Password fields must match. ")
        }
        return mayProcede
    }
}
