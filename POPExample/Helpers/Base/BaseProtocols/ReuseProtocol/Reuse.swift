//
//  Reuse.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

protocol Reuse: AnyObject {
    /// Reuse identifier
    static var reuseIdentifier: String { get }
}
