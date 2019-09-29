//
//  FileCell.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 04. 29..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class FileCell: UITableViewCell {

    @IBOutlet weak var fileNameLbl: UILabel!
    @IBOutlet weak var donloadBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 6.0
        
    }
   
    func configureCell(kuki: Files){
        
        fileNameLbl.text = kuki.fileName
        
        if(kuki.downloaded == true){
            deleteBtn.isHidden = true
            donloadBtn.isHidden = false
        }else {
            deleteBtn.isHidden = false
            donloadBtn.isHidden = true
        }
        
    }
    

}
