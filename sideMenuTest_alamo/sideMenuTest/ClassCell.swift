//
//  ClassCell.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 04. 28..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class ClassCell: UICollectionViewCell {
    
    @IBOutlet weak var modulLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var tolLbl: UILabel!
    @IBOutlet weak var igLbl: UILabel!
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 6.0
        
    }
    
   
    
    func configureCell(asd: Class) {
        
        modulLbl.text = asd.className
        dayLbl.text = asd.classDay
        dateLbl.text = asd.classDate
        tolLbl.text = asd.classStart
        igLbl.text = asd.classFinish
        
        
    }
    
}
