//
//  DateExtension.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import Foundation

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
