//
//  UIString+Extension.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//
import Foundation

extension String {
    /// server date to human reable date
    ///  Return  String
    func formatHumanReadableDate(withFormat format: String = "dd.MM.yyyy") -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date : Date = dateFormatterGet.date(from: self) ?? Date()
        
        dateFormatterGet.dateFormat = format
        return dateFormatterGet.string(from: date)
    }

   
    /// encodedString to handle turkish chrachters for request
    func encodedURL() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
