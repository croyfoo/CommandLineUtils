//
//  FileExtensions.swift
//  DailyWork
//
//  Created by David Croy on 12/18/19.
//  Copyright © 2019 DoubleDog Software. All rights reserved.
//

import Foundation
import Files

extension File {
    
    public func readLines() throws -> [String] {
        try readAsString(encodedAs: .utf8).split(separator: "\n").map{ String($0) }
    }
}
