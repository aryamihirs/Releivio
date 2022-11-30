//
//  File.swift
//  
//
//  Created Zhuokai Yu on 2022/11/27.
//

import Foundation
import XCTest

import XCTest

class UnitTests : XCTestCase {
  func testContentView(){
    let app = XCUIApplication
    app.lanuch()
    let stresslevel = 40
    let level_unhappy:String = "It is natural to feel tired and depressed.\nThis may be because of insomnia, untimely work, rest, etc. Don't worry, incorporating meditation and rest go a long way and improve our overall wellbeing!"
      //text of advice for frustrated status
      XCTAassertEqual(input.ContentView(), level_unhappy, "The content is  not correctly generated")
}
        }
