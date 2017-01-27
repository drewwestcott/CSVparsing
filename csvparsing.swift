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

// Refactored Above into one function

func parseCSV(file: String) -> [[String]] {
	
	var rows = [String]()
	var columns = [[String]]()
	
	// Parse a CSV and return an Array of Strings which will represent the column data
	
	let filePath = Bundle.main.path(forResource: file, ofType: "csv")!
	do {
		let fileContents = try String(contentsOfFile: filePath)
		theFile = fileContents
		
		theFile.enumerateLines(invoking: { (row, _) in
			rows.append(row)
		})
		
		for row in rows {
			let column = row.components(separatedBy: "\t")
			columns.append(column)
		}
	} catch {
		print("Try failed")
	}
	return columns
}

let fields = parseCSV(file: "become-what-you-believe-t")
let theDay = 10
if fields.count > theDay  {
	let days = theDay
	let dayDetails = fields[days]
	let thought2 = dayDetails[1]
	let mantra2 = dayDetails[2]
	let meaning2 = dayDetails[3]
}
