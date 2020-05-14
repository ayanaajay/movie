//
//  reviewTableViewCell.swift
//  movielist
//
//  Created by Ayana on 14/05/20.
//  Copyright © 2020 Ayana. All rights reserved.
//

import UIKit

class reviewTableViewCell: UITableViewCell {

    @IBOutlet weak var contenttxt: UITextView!
    @IBOutlet weak var authorlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
