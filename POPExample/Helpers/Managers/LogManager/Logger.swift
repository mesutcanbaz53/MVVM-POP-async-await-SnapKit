//
//  LogManager.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation
enum LoggerEnum: String {
    case isNil = "is Nil"
}

class Logger: LogProtocol {
    ///log for items etc: Int,Searchbar
    static func Log<T>(item: T, _ message: LoggerEnum) {
        print("❗️❗️❗️")
        printLog(item: item, message.rawValue)
        print("❗️❗️❗️")
    }
    ///basic log
    static func plain(log: String) {
        print(log)
    }
    ///ongoing request log
    static func request(log: String?) {
        print("✈️✈️✈️ ")
        print(log ?? "")
        print("✈️✈️✈️")
    }
    ///response log
    static func response(log: NSString?) {
        print("✅✅✅✅ ")
        print(log ?? "")
        print("✅✅✅✅")
    }
    /// network prerequest error log
    static func http(log: String) -> String {
        return log
    }
    
}
