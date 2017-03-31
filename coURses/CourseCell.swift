//
//  CourseCell.swift
//  ClassPlanner
//
//  Created by Juan Pablo Castano on 11/6/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell{

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var credits: UILabel!
    
    var code: String!
    var course: Course!
    
    func getCode() -> String {
        return code;
    }
    
    func updateLabels() {
        let titleFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        title.font = titleFont
        
        let detailFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        department.font = detailFont
        credits.font = detailFont
    }
}
