//
//  DataTableCell.swift
//  ApiMethods
//
//  Created by AshutoshD on 07/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class DataTableCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblAbbr: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
