//
//  LoginViewController.swift
//  Testdemo
//
//  Created by Exarcplus on 10/01/19.
//  Copyright © 2019 Exarcplus. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var emailtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        if UserDefaults.standard.value(forKey: "Logindetail") == nil
//        {
//            print("nil")
//        }
//        else{
//            let mainview = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//            let nav = UINavigationController.init(rootViewController: mainview)
//            self.present(nav, animated:true, completion: nil)
//        }
        // Do any additional setup after loading the view.
    }
    

    func validateEmail(_ candidate: String) -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
    @IBAction func loginbuttonclick(_ sender: UIButton)
    {
        if emailtext.text != ""
        {
            if !validateEmail(emailtext.text!)
            {
                let myAlert = UIAlertController(title:"Login", message: "Enter Valid Email ID", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                myAlert.addAction(okAction)
                self.present(myAlert, animated: true, completion: nil)
                return
                
            }
            else{
                print(emailtext.text)
                self.loginlink()
            }
        }
    }
        
        
        func loginlink()
        {
            let params:[String:String] = ["emailId":emailtext.text!]
            Alamofire.request("http://surya-interview.appspot.com/list", method: .post, parameters: params,encoding:
                JSONEncoding.default, headers: nil).responseJSON {
                    response in
                     print(response)
                    switch response.result {
                       
                    case .success:
                        print(response)
                        if let dict = response.result.value as? Dictionary<String,AnyObject>{
                            print(dict)
                            
                            let data = dict["items"] as? [Dictionary<String,AnyObject>]
                            print(data)
                            UserDefaults.standard.set(data, forKey: "Logindetail")
                            let mainview = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                            let nav = UINavigationController.init(rootViewController: mainview)
                            self.present(nav, animated:true, completion: nil)
                        }
                        break
                        
                    case .failure(let error):
                        print(error)
                    }
            }
        }
   

}
