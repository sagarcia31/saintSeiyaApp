//
//  SeiyaTableViewCell.swift
//  Saint Seiya App
//
//  Created by Marcelo Garcia on 18/02/22.
//

import UIKit

class SeiyaTableViewCell: UITableViewCell {
    
    // MARK: OUTLETS
    @IBOutlet weak var seiyaImageView: UIImageView!
    @IBOutlet weak var seiyaTitleLabel: UILabel!
    @IBOutlet weak var seiyaSubTitleLabel: UILabel!
    @IBOutlet weak var seiyaCategoryLabel: UILabel!
    @IBOutlet weak var seiyaCategoryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seiyaImageView.roundImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
