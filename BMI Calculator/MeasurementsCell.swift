//
//  MeasurementsCell.swift
//  BMI Calculator
//
//  Created by Onur Fidan on 16.06.2023.
//

import UIKit

class MeasurementsCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var BMIValueLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
