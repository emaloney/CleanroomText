//
//  PluralizerTests.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 4/1/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation
import XCTest
import CleanroomText

class PluralizerTests: XCTestCase
{
    func testSimpleTwoFormPluralizer()
    {
        let plur = Pluralizer(singular: "pony", plural: "ponies")

        XCTAssert(plur.term(quantity: -3) == "ponies")
        XCTAssert(plur.term(quantity: -2) == "ponies")
        XCTAssert(plur.term(quantity: -1) == "ponies")
        XCTAssert(plur.term(quantity: 0) == "ponies")
        XCTAssert(plur.term(quantity: 1) == "pony")
        XCTAssert(plur.term(quantity: 2) == "ponies")
        XCTAssert(plur.term(quantity: 3) == "ponies")
    }
    
    func testSimpleThreeFormPluralizer()
    {
        let plur = Pluralizer(singular: "pony", plural: "ponies", none: "none")

        XCTAssert(plur.term(quantity: -3) == "ponies")
        XCTAssert(plur.term(quantity: -2) == "ponies")
        XCTAssert(plur.term(quantity: -1) == "ponies")
        XCTAssert(plur.term(quantity: 0) == "none")
        XCTAssert(plur.term(quantity: 1) == "pony")
        XCTAssert(plur.term(quantity: 2) == "ponies")
        XCTAssert(plur.term(quantity: 3) == "ponies")
    }

    func testTwoFormPluralizerWithQuantity()
    {
        let plur = Pluralizer(singular: "one pony", plural: "{#} ponies")

        XCTAssert(plur.term(quantity: -3) == "-3 ponies")
        XCTAssert(plur.term(quantity: -2) == "-2 ponies")
        XCTAssert(plur.term(quantity: -1) == "-1 ponies")
        XCTAssert(plur.term(quantity: 0) == "0 ponies")
        XCTAssert(plur.term(quantity: 1) == "one pony")
        XCTAssert(plur.term(quantity: 2) == "2 ponies")
        XCTAssert(plur.term(quantity: 3) == "3 ponies")
    }
    
    func testThreeFormPluralizerWithQuantity()
    {
        let plur = Pluralizer(singular: "one pony", plural: "{#} ponies", none: "no ponies")

        XCTAssert(plur.term(quantity: -3) == "-3 ponies")
        XCTAssert(plur.term(quantity: -2) == "-2 ponies")
        XCTAssert(plur.term(quantity: -1) == "-1 ponies")
        XCTAssert(plur.term(quantity: 0) == "no ponies")
        XCTAssert(plur.term(quantity: 1) == "one pony")
        XCTAssert(plur.term(quantity: 2) == "2 ponies")
        XCTAssert(plur.term(quantity: 3) == "3 ponies")
    }

    func testAllFormsPluralizer()
    {
        let plur = Pluralizer(allForms: "pony")

        XCTAssert(plur.term(quantity: -3) == "pony")
        XCTAssert(plur.term(quantity: -2) == "pony")
        XCTAssert(plur.term(quantity: -1) == "pony")
        XCTAssert(plur.term(quantity: 0) == "pony")
        XCTAssert(plur.term(quantity: 1) == "pony")
        XCTAssert(plur.term(quantity: 2) == "pony")
        XCTAssert(plur.term(quantity: 3) == "pony")
    }

    func testAllFormsPluralizerWithQuantity()
    {
        let plur = Pluralizer(allForms: "{#} pony")

        XCTAssert(plur.term(quantity: -3) == "-3 pony")
        XCTAssert(plur.term(quantity: -2) == "-2 pony")
        XCTAssert(plur.term(quantity: -1) == "-1 pony")
        XCTAssert(plur.term(quantity: 0) == "0 pony")
        XCTAssert(plur.term(quantity: 1) == "1 pony")
        XCTAssert(plur.term(quantity: 2) == "2 pony")
        XCTAssert(plur.term(quantity: 3) == "3 pony")
    }

}
