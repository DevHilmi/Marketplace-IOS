//
//  KategoriTableViewCell.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 4/2/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//

import UIKit

class KategoriTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var txtkategori: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
