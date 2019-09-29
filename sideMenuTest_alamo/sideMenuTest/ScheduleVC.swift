//
//  ScheduleVC.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 02. 23..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var classes: [Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        let ora = Class(className: "Modul_1", classDate: "2018.02.14", classStart: "08:15", classFinish: "14:00", classDay: "Szerda")
        let ora2 = Class(className: "Modul_1", classDate: "2018.02.15", classStart: "08:15", classFinish: "14:00", classDay: "Csütörtök")
        let ora3 = Class(className: "Modul_1", classDate: "2018.03.14", classStart: "08:15", classFinish: "14:00", classDay: "Szerda")
        let ora4 = Class(className: "Modul_2", classDate: "2018.03.15", classStart: "08:15", classFinish: "14:00", classDay: "SCsütörtök")
        let ora5 = Class(className: "Modul_2", classDate: "2018.04.15", classStart: "08:15", classFinish: "14:00", classDay: "Szerda")
        let ora6 = Class(className: "Modul_2", classDate: "2018.04.14", classStart: "08:15", classFinish: "14:00", classDay: "Szerda")
        let ora7 = Class(className: "Modul_3", classDate: "2018.02.15", classStart: "08:15", classFinish: "14:00", classDay: "Csütörtök")
        let ora8 = Class(className: "Modul_3", classDate: "2018.02.14", classStart: "08:15", classFinish: "14:00", classDay: "Szerda")
        let ora9 = Class(className: "Modul_4", classDate: "2018.02.15", classStart: "08:15", classFinish: "14:00", classDay: "Péntek")
        let ora11 = Class(className: "Modul_5", classDate: "2018.02.14", classStart: "08:15", classFinish: "14:00", classDay: "Szerda")
        
        classes.append(ora)
        classes.append(ora2)
        classes.append(ora3)
        classes.append(ora4)
        classes.append(ora5)
        classes.append(ora6)
        classes.append(ora7)
        classes.append(ora8)
        classes.append(ora9)
        classes.append(ora11)
        
        
    }
    

    
    @IBAction func backBtnPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classes.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
     
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classCell", for: indexPath) as? ClassCell{
            
            let classObject = classes[indexPath.row]
            
            
            cell.configureCell(asd: classObject)
            
            return cell
        }else {
            return UICollectionViewCell()
        }
    }

    
}
