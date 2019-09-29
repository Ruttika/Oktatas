//
//  FileTablteViewVC.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 04. 29..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class FileTablteViewVC: UITableViewController {

  var items: [Files] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kak = Files(fileName: "Tananyag231412.pdf", downloaded: true)
        let kak1 = Files(fileName: "Tananyag231412.pdf", downloaded: false)
        let kak2 = Files(fileName: "Tananyag231412.pdf", downloaded: true)
        let kak3 = Files(fileName: "Tananyag231412.pdf", downloaded: false)
        let kak4 = Files(fileName: "Tananyag231412.pdf", downloaded: true)
        let kak5 = Files(fileName: "Tananyag231412.pdf", downloaded: false)
        
        items.append(kak)
        items.append(kak1)
        items.append(kak2)
        items.append(kak3)
        items.append(kak4)
        items.append(kak5)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath) as? FileCell{
            
            let item = items[indexPath.row]
            
            cell.configureCell(kuki: item)
            
            return cell
        }else {
            
            return UITableViewCell()
        }

       

        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
