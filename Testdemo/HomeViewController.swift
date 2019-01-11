//
//  HomeViewController.swift
//  Testdemo
//
//  Created by Exarcplus on 10/01/19.
//  Copyright © 2019 Exarcplus. All rights reserved.
//

import UIKit
import SDWebImage

@available(iOS 11.0, *)
class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    @IBOutlet weak var listtable : UITableView!
    
    var listarr = [Dictionary<String,AnyObject>]()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
         if UserDefaults.standard.value(forKey: "Logindetail") != nil{
            let result = UserDefaults.standard.value(forKey: "Logindetail")
            listarr = result as! [Dictionary<String,AnyObject>]
        }
        listtable.contentInsetAdjustmentBehavior = .automatic
        listtable.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view.layoutIfNeeded()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listarr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        
        cell.profimage.layer.masksToBounds = true
        cell.profimage.layer.cornerRadius = 30
        let img = listarr[indexPath.row]["imageUrl"] as! String
        if img != ""
        {
            let newString = img.replacingOccurrences(of: " ", with: "%20")
            cell.profimage.sd_setImage(with:  URL(string: newString))
        }
        else
        {
            cell.profimage.image = UIImage.init(named: "Pro_1.png")
        }
        let firstname = listarr[indexPath.row]["firstName"] as! String
        cell.firstnamelab.text = "FirstName: " + firstname
        let lastname = listarr[indexPath.row]["lastName"] as! String
        cell.lastnamelab.text = "LastName: " + lastname
        let email = listarr[indexPath.row]["emailId"] as! String
        cell.emaillab.text = "Email: " + email
        return cell;
    }

}
