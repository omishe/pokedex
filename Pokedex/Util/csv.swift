//
//  csv.swift
//  Pokedex
//
//  Created by Omishe Hernandez on 03/05/26.
//

import Foundation

public class CSV {
    public var headers: [String] = []
    public var rows: [Dictionary<String, String>] = []
    public var columns = Dictionary<String, [String]>()
    var delimeter = CharacterSet(charactersIn: ",")
    
    public init(content: String?, delimiter: CharacterSet, encoding: UInt) throws {
        
        if let csvStringToParse = content {
            self.delimeter = delimiter
            
            let newline = CharacterSet.newlines
            var lines: [String] = []
            csvStringToParse.trimmingCharacters(in: newline).enumerateLines{ line, stop in
                lines.append(line)}
            
            self.headers = self.parseHeaders(fromLines: lines) 
            self.rows = self.parseRows(fromLines: lines)
            self.columns = self.parseColumns(fromLines: lines)
        }
    }
    
    public convenience init(contentsOfURL url: String) throws {
        let comma = CharacterSet(charactersIn: ",")
        let csvString: String?
        do {
            
            //let encoding = String.Encoding(rawValue: NSUTF8StringEncoding)
            //csvString = try String(contentsOfFile: url, encoding: encoding)
            csvString = try String(contentsOfFile: url, encoding: String.Encoding.utf8)
        } catch _ {
            csvString = nil
        }
        try self.init(content: csvString, delimiter: comma, encoding: String.Encoding.utf8.rawValue)
    }
    
    func parseHeaders(fromLines lines: [String]) -> [String]{
        return lines[0].components(separatedBy: self.delimeter)
    }
    
    func parseRows(fromLines lines: [String]) -> [Dictionary<String, String>]{
        var rows: [Dictionary<String, String>] = []
        
        for (lineNumber, line) in lines.enumerated(){
            if lineNumber == 0 {
                continue
            }
            
            var row = Dictionary<String, String>()
            let values = line.components(separatedBy:  self.delimeter)
            for(index, header) in self.headers.enumerated(){
                if index < values.count {
                    row[header] = values[index]
                } else {
                    row[header] = ""
                }
            }
            rows.append(row)
        }
        return rows
    }
    
    func parseColumns(fromLines lines: [String]) -> Dictionary<String, [String]>{
        var columns = Dictionary<String, [String]>()
        
        for header in self.headers {
            let column = self.rows.map{ row in row[header] != nil ? row[header] : "" }
            columns[header] = column as? [String]
        }
        
        return columns
    }
    
}
