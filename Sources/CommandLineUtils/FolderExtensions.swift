//
//  FolderExtensions.swift
//  DailyWork
//
//  Created by David Croy on 12/18/19.
//  Copyright © 2019 DoubleDog Software. All rights reserved.
//

import Foundation
import Files

extension Folder {

    public static var icloudDocument: Folder {
        try! Folder(path: "~/Library/Mobile Documents/com~apple~CloudDocs/")
    }
    
    public static func foldingTextFolder() throws -> Folder {
        let folder = Self.icloudDocument
        return try Folder(path: folder.path + "/Folding Text/Work Summaries")
    }
}

