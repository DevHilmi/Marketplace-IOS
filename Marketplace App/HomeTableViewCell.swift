//
//  HomeTableViewCell.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 3/27/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var titleCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        homeCollectionView.delegate = dataSourceDelegate
        homeCollectionView.dataSource = dataSourceDelegate
        homeCollectionView.tag = row
        homeCollectionView.reloadData()
    }
}
