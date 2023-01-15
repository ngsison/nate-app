//
//  MonthViews.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import Foundation

struct MonthViews: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
    
    static var allMonthViews = [MonthViews(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 55000),
                                MonthViews(date: Date.from(year: 2023, month: 2, day: 1), viewCount: 89000),
                                MonthViews(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 34000),
                                MonthViews(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 56000),
                                MonthViews(date: Date.from(year: 2023, month: 5, day: 1), viewCount: 100000),
                                MonthViews(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 85000),
                                MonthViews(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 75000),
                                MonthViews(date: Date.from(year: 2023, month: 8, day: 1), viewCount: 35000),
                                MonthViews(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 25000),
                                MonthViews(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 110000),
                                MonthViews(date: Date.from(year: 2023, month: 11, day: 1), viewCount: 50000),
                                MonthViews(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 59000)]
}
