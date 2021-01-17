//
//  Parsing.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 04.01.2021.
//

import Foundation

protocol PassJson: AnyObject {
    
    func readLocalJson(jsonName: String) -> Data?
    
    func parseJson(jsonData: Data) -> [List]?
    
    //func loadJson(fileName: String) -> [List]?
}

final class Parsing: PassJson {
    
    func readLocalJson(jsonName: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: jsonName, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }

    func parseJson(jsonData: Data) -> [List]? {
        do {
            let decodedData = try JSONDecoder().decode(JsonModel.self, from: jsonData)
            return decodedData.result.list
        } catch {
            print("Error is \(error)")
        }
        return nil
    }
    
//    func loadJson(fileName: String) -> [List]? {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let jsonData = try JSONDecoder().decode(JsonModel.self, from: data)
//                return jsonData.result.list
//            } catch {
//                print("Error: \(error)")
//            }
//        }
//        return nil
//    }
}
