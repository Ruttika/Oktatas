//
//  MessageCell.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 04. 28..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    
    @IBOutlet weak var senderLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureTableViewCell(message: Message) {
        
        self.senderLbl.text = message.sender
        self.messageLbl.text = message.message
        self.dateLbl.text = message.sentTime
    }

}
