//
//  StringExtensions.swift
//  DailyWork
//
//  Created by David Croy on 12/18/19.
//  Copyright © 2019 DoubleDog Software. All rights reserved.
//

import Foundation

extension String {
    public func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    public func deleteTags() -> String {
        self.contains("@") ? self.split(separator: "@")[0].reduce("") { String($0) + String($1) } : self
    }

}
