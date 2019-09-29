//
//  Files.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 04. 28..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation

class Files {
    
    private var _fileName: String!
    private var _downloaded: Bool!
    
    var fileName: String {
        get {
            return _fileName
        }
    }
    
    var downloaded: Bool {
        get {
            return _downloaded
        }
    }
    
    init(fileName: String, downloaded: Bool) {
        self._fileName = fileName
        self._downloaded = downloaded
    }    
}
