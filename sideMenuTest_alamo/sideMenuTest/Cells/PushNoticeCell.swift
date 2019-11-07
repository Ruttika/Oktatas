//
//  PushNoticeCell.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 11. 02..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class PushNoticeCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureTableViewCell(pushmessage: PushMessage ) {

        let message = String("\(pushmessage.message)")
        var kek = self.hexToStr(text: message)
        //var kek = message
        print(kek)
        self.messageLbl.text = kek


        print(message)

        self.dateLbl.text = pushmessage.date

    }
    

    func hexToStr(text: String) -> String {
        
        let regex = try! NSRegularExpression(pattern: "(0x)?([0-9A-Fa-f]{2})", options: .caseInsensitive)
        let textNS = text as NSString
        let matchesArray = regex.matches(in: textNS as String, options: [], range: NSMakeRange(0, textNS.length))
        let characters = matchesArray.map {
            Character(UnicodeScalar(UInt32(textNS.substring(with: $0.range(at: 2)), radix: 16)!)!)
        }
        
        return String(characters)
    }
}
