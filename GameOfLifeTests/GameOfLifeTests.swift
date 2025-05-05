//
//  GameOfLifeTests.swift
//  GameOfLifeTests
//
//  Created by Rafael Carvalho on 04/05/25.
//

import XCTest
@testable import GameOfLife

final class GameOfLifeTests: XCTestCase {

    func testCreateNextGen_blinker() {
        //initial blinker
        let initial: Set<Point> = [
            Point(x: 1, y: 0),
            Point(x: 1, y: 1),
            Point(x: 1, y: 2)
        ]

        let expected: Set<Point> = [
            Point(x: 0, y: 1),
            Point(x: 1, y: 1),
            Point(x: 2, y: 1)
        ]

        var result = initial
        
        //for a blinker to oscilate it need odd iterations. Even iterations results in initial state
        let iterations = 3
        
        for _ in 0..<iterations {
            result = ConwaysGOF.game.createNextGen(from: result)
        }
        XCTAssertEqual(result, expected)
    }
    
    func testCreateNextGen_block() {
        //initial block
        let initial: Set<Point> = [
            Point(x: 0, y: 0),
            Point(x: 0, y: 1),
            Point(x: 1, y: 0),
            Point(x: 1, y: 1)
        ]
        
        var result = initial
        
        //block should never change
        let iterations = 57
        
        for _ in 0..<iterations {
            result = ConwaysGOF.game.createNextGen(from: result)
        }
        XCTAssertEqual(result, initial, "Block pattern should remain unchanged")
    }
    
    func testCreateNextGen_diehard() {
        //initial block
        let initial: Set<Point> = [
            Point(x: 0, y: 1),
            Point(x: 1, y: 0),
            Point(x: 1, y: 1),
            Point(x: 5, y: 0),
            Point(x: 6, y: 0),
            Point(x: 6, y: 2),
            Point(x: 7, y: 0)
        ]
        
        var result = initial
        
        //diehard should dissapear after 130 iterations. So state should be empty
        let iterations = 130
        
        for _ in 0..<iterations {
            result = ConwaysGOF.game.createNextGen(from: result)
        }
        
        XCTAssertTrue(result.isEmpty, "Diehard should die after 130 iterations")
    }

    func testPerformanceWithMetrics() {
        let metrics: [XCTMetric] = [
            XCTClockMetric(),
            XCTCPUMetric(),
            XCTMemoryMetric()
        ]

        //diehard pattern
        measure(metrics: metrics) {
            let initial: Set<Point> = [
                Point(x: 0, y: 1),
                Point(x: 1, y: 0),
                Point(x: 1, y: 1),
                Point(x: 5, y: 0),
                Point(x: 6, y: 0),
                Point(x: 6, y: 2),
                Point(x: 7, y: 0)
            ]

            var result = initial
            
            let iterations = 130
            
            for _ in 0..<iterations {
                result = ConwaysGOF.game.createNextGen(from: result)
            }

            XCTAssertTrue(result.isEmpty)
        }
    }

}
