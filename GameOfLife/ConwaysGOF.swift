//
//  ConwaysGOF.swift
//  GameOfLife
//
//  Created by Rafael Carvalho on 03/05/25.
//

import Foundation

class ConwaysGOF {
    static var game: ConwaysGOF = {
        let instance = ConwaysGOF()
        return instance
    }()
    
    private init() {}
    
    func setInitialState() -> Set<Point> {
        //read input
        guard let path = Bundle.main.path(forResource: "input", ofType: "txt") else {
            fatalError("Could not get path to input file.")
        }
        
        guard let content = try? String(contentsOfFile: path) else {
            fatalError("Could not read input file.")
        }
        
        var liveCells = Set<Point>()
        let lines = content.split(separator: "\n")

        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            if trimmed.isEmpty || trimmed.hasPrefix("#") {
                continue
            }

            let parts = trimmed.split(separator: " ")
            if parts.count == 2, let x = Int64(parts[0]), let y = Int64(parts[1]) {
                liveCells.insert(Point(x: x, y: y))
            }
        }

        return liveCells
    }
    
    //get next generation
    func createNextGen(from aliveCells: Set<Point>) -> Set<Point> {
        var neighborCount: [Point: Int] = [:]

        let neighboursDirections = [
            (-1, -1), (0, -1), (1, -1),
            (-1,  0), (1,  0),
            (-1,  1), (0,  1), (1,  1)
        ]

        for cell in aliveCells {
            for direction in neighboursDirections {
                let neighbor = Point(x: cell.x + Int64(direction.0), y: cell.y + Int64(direction.1))
                neighborCount[neighbor, default: 0] += 1
            }
        }

        var next = Set<Point>()
        for (cell, count) in neighborCount {
            if (count == 2 && aliveCells.contains(cell)) || count == 3 {
                next.insert(cell)
            }
        }

        return next
    }
    
    //passes how many iterations you want to roll
    func start(iterations: Int) -> String {
        var state = setInitialState()

        for _ in 0..<iterations {
            state = createNextGen(from: state)
        }

        var result = ""
        //print result in Life 1.06 format
        print("#Life 1.06")
        result += "#Life 1.06\n\n"
        for cell in state.sorted(by: { ($0.x, $0.y) < ($1.x, $1.y) }) {
            print("\(cell.x) \(cell.y)")
            result += "\(cell.x) \(cell.y)\n"
        }
        
        return result
    }
}
