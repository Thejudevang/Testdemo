//
//  HomeTableViewCell.swift
//  Testdemo
//
//  Created by Exarcplus on 10/01/19.
//  Copyright © 2019 Exarcplus. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var  firstnamelab : UILabel!
    @IBOutlet weak var  lastnamelab : UILabel!
    @IBOutlet weak var  emaillab : UILabel!
    @IBOutlet weak var  profimage : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
