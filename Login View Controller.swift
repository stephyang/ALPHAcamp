//
//  Login View Controller.swift
//  ALPHAcamp
//
//  Created by stephanie yang on 2016/4/1.
//  Copyright © 2016年 stephanie yang. All rights reserved.
//

import UIKit
import Alamofire

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
        let password = textFieldEmail.text
        
        let url = "https://dojo.alphacamp.co/api/vi/login"
        
        Alamofire.request(.POST, url, parameters: ["email": eamil!,"password":password!] encoding: <#T##ParameterEncoding#>, headers: <#T##[String : String]?#>)
    }


    
    
    
    
}
