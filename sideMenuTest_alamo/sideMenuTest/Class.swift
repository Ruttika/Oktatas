//
//  Class.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 04. 28..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation


class Class{
    
    private var _className: String!
    private var _classDate: String!
    private var _classStart: String!
    private var _classFinish: String!
    private var _classDay: String!
    
    
    
    var className: String {
        get {
            return _className
        }
    }
    
    var classDate: String {
        get {
            return _classDate
        }
    }
    
    var classStart: String {
        get {
            return _classStart
        }
    }
    
    var classFinish: String {
        get {
            return _classFinish
        }
    }
    
    var classDay: String {
        get {
            return _classDay
        }
    }
    
    init(className: String, classDate: String, classStart: String, classFinish: String, classDay: String) {
        
        self._className = className
        self._classDate = classDate
        self._classStart = classStart
        self._classFinish = classFinish
        self._classDay = classDay
    }
    
}
