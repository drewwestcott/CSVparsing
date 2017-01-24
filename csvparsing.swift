//: Playground - noun: a place where people can play

import UIKit

var theFile: String = ""
var lines = [String]()
var day = [Int]()
var thought = [String]()


func readFile(file: String) -> String {
	
	let filePath = Bundle.main.path(forResource: "become-what-you-believe-t", ofType: "csv")!
	do {
		let fileContents = try String(contentsOfFile: filePath)
		theFile = fileContents
	} catch {
		print("Try failed")
	}
	
	return theFile
}

func splitIntoLines(theFile: String) -> [String] {
	lines = (theFile.components(separatedBy: "\r"))
	return lines
}

func splitIntoFields(rows: [String]) {
	for row in rows {
		let column = row.components(separatedBy: "\t")
		if let dayNumber = Int(column[0]) {
			day.append(dayNumber)
		} else {
			day.append(0)
		}
		thought.append(column[1])
		
	}
}

let rows = readFile(file: "become-what-you-believe-t") // returns string

if !(rows.isEmpty) {
	splitIntoFields(rows: [rows])
}

for x in 0..<day.count {
	print("Day:\(day[x]) [\(thought[x])]")
}
