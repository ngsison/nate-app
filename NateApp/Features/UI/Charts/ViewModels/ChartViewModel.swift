//
//  ChartViewModel.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import Foundation

class ChartViewModel: ObservableObject {
    let monthViews = MonthViews.allMonthViews
    
    var totalViews: Int {
        monthViews.map(\.viewCount).reduce(0, +)
    }
}
