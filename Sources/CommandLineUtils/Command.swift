//
//  Command.swift
//  DownloadData
//
//  Created by David Croy on 8/24/19.
//  Copyright © 2019 DoubleDog Software. All rights reserved.
//

import Foundation
import SPMUtility
import Basic

protocol Command {
    var command:  String { get }
    var overview: String { get }
    
    init(parser: ArgumentParser)
    func run(with arguments: ArgumentParser.Result) throws -> Bool
 }

struct CommandRegistry {
    
    private let parser: ArgumentParser
    private var commands = [Command]()
    
    init(usage: String, overview: String) {
        parser = ArgumentParser(usage: usage, overview: overview)
    }
    
    mutating func register(command: Command.Type) {
        commands.append(command.init(parser: parser))
    }
    
    func run() {
        do {
            let parsedArguments = try parse()
            try process(arguments: parsedArguments)
        }
        catch let error as ArgumentParserError {
            print(error.description)
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func parse() throws -> ArgumentParser.Result {
        let arguments = Array(ProcessInfo.processInfo.arguments.dropFirst())
        if arguments.count == 0 {
            parser.printUsage(on: stdoutStream)
            exit(0)
        }
        return try parser.parse(arguments)
    }
    
    private func process(arguments: ArgumentParser.Result) throws {
        for command in commands {
            let value = try command.run(with: arguments)
            if value {
                return
            }
        }
//        guard let subparser = arguments.subparser(parser),
//            let command = commands.first(where: { $0.command == subparser}) else {
//                parser.printUsage(on: stdoutStream)
//                return
//        }
    }

}
