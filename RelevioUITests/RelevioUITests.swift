//
//  RelevioUITests.swift
//  RelevioUITests
//
//  Created by Arya Mihir Singh on 10/9/22.
//

import XCTest
import SwiftUI

final class RelevioUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(true, "Execution test passed!")
    }
    
    
    func testRetreveStressLevelColor(stressLevel: Int, color: Color){
        let app = XCUIApplication()
        app.launch()
        Bool res = getStressLevelColor(stressLevel) == color
        XCTAssert(res, "Execution test passed!")
    }

    func testRetreveStressLevelEmojis(Int: stressLevel, emoji){
        let app = XCUIApplication()
        app.launch()
        res = getStressLevelEmoji(stressLevel) == emoji
        XCTAssert(res, "Execution test passed!")
    }

    func testChangeInColorBasedOnStressLevel(stressLevel, color){
        let app = XCUIApplication()
        app.launch()
        prev = getStressLevelColor(stressLevel)
        curr = getStressLevelColor((stressLevel+50)//100)
        res = prev != curr
        XCTAssert(res, "Execution test passed!")
    }

    func testRetreveStressLevelValue(){
        let app = XCUIApplication()
        app.launch()
        val = getRandomStressLevelValue()
        if val<101 and val>0:
            res = True
        else:
            res = False
        XCTAssert(res, "Execution test passed!")
    }
    
    func testChangeInColorBasedOnStressLevel(){}
    
    func testRetreveStressLevelValue(){}
    
    func testRetreveStressLevelColor(){}
    
    func testRetreveStressLevelEmojis(){}
    
    func testNavigationFlow(){}
    
    func testIsDashboardScrollable(){}
    
    func testIsDashboardViewRendered(){}

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
