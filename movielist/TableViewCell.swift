//
//  TableViewCell.swift
//  movielist
//
//  Created by Ayana on 08/05/20.
//  Copyright © 2020 Ayana. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imagee: UIImageView!
    @IBOutlet weak var yearlabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
