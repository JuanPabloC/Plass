//
//  SemesterCell.swift
//  coURses
//
//  Created by Juan Pablo Castano on 12/15/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit

class SemesterCell: UITableViewCell{
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var totalCredits: UILabel!
    
    
    func updateLabels() {
        let titleFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        title.font = titleFont
        
        let detailFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        totalCredits.font = detailFont
    }

}
