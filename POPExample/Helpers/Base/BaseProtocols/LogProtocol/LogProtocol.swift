//
//  LogProtocol.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation
protocol LogProtocol: AnyObject {}

extension LogProtocol where Self: Logger {
    static func printLog<T>(item: T, _ message: String) {
        print(T.self, message)
    }
}
