//
//  Parsing.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 04.01.2021.
//

import Foundation

protocol PassJson: AnyObject {
    
    func readLocalJson(jsonName: String) -> Data?

    func parseJson(jsonData: Data) -> (list: [List]?, title: String)
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

    func parseJson(jsonData: Data) -> (list: [List]?, title: String) {
        do {
            let decodedData = try JSONDecoder().decode(JsonModel.self, from: jsonData)
            return (decodedData.result.list,decodedData.result.title)
        } catch {
            print("Error is \(error)")
        }
        return (nil,"")
    }
}
