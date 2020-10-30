//
//  gokasTests.swift
//  gokasTests
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import XCTest
@testable import gokas

class gokasTests: XCTestCase {

    var sut: ViewController!

    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    override func setUp() {
        super.setUp()
        sut = ViewController()
    }
    
    func testCallTable(){
        let tableCell = Bundle(for: FirstCollectionTableViewCell.self).loadNibNamed("FirstCollectionTableViewCell", owner: nil)?.first as! FirstCollectionTableViewCell
        
        XCTAssertNotNil(tableCell)
    }
    
    }


