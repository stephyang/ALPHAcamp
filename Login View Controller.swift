//
//  Login View Controller.swift
//  ALPHAcamp
//
//  Created by stephanie yang on 2016/4/1.
//  Copyright © 2016年 stephanie yang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Login_View_Controller: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doLogin(sender: AnyObject) {
        let email = textFieldEmail.text
        let password = textFieldPassword.text
        let url = "https://dojo.alphacamp.co/api/v1/login"
        
        print("hi")
        
        Alamofire.request(.POST, url, parameters: ["email": email!, "password":password!,"api_key":"ef81632058bf2e75925f7f9d747a34df55d86072"]).responseJSON
            { response in
               
                if JSON(response.result.value!)["message"].stringValue == "Ok"{
                let auth_token = JSON(response.result.value!)["auth_token"].stringValue
//                    寫入userDefault
                let userDefault = NSUserDefaults.standardUserDefaults()
                    userDefault.setObject(auth_token, forKey: "auth_token")
                    userDefault.synchronize()

                    self.dismissViewControllerAnimated(true, completion: nil)

                }
                
                if JSON(response.result.value!)["message"].description == "Failed"{
                    let alert = UIAlertController.init(title: nil, message: "帳號或密碼有誤，請再輸入一次", preferredStyle: .Alert)
                    let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alert.addAction(okAction)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                
                }
                            
        }
        
        
    }



    
    
}
