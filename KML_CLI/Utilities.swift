//
//  Utilities.swift
//  KML_CLI
//
//  Created by Matthew Elmore on 8/2/18.
//  Copyright © 2018 Matthew Elmore. All rights reserved.
//

import Foundation


class Utilities {
    func writeToDocuments(stringToWrite: String, fileName: String, ext: String) {
        let filenameWithExt = "\(fileName).\(ext)"
        let urlName = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!.appendingPathComponent("02_KML/\(filenameWithExt)")
        let myData = Data(stringToWrite.utf8)
        do {
            try myData.write(to: urlName, options: .atomic)
        } catch {
            print(error)
        }
    }
}
