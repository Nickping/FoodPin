//
//  MyIconTextTableViewCell.swift
//  FoodPin
//
//  Created by Euijoon Jung on 2018. 8. 3..
//  Copyright © 2018년 AppCoda. All rights reserved.
//

import UIKit

class MyIconTextTableViewCell: UITableViewCell {

    @IBOutlet weak var myRestaurantLabelView: UILabel!
    @IBOutlet weak var myRestaurantImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
