//
//  ChartView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import Charts
import SwiftUI

struct ChartView: View {
    @ObservedObject var viewModel = ChartViewModel()
    
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 29) {
                ChartsHeader(totalViews: viewModel.totalViews)
                BarChart(monthViews: viewModel.monthViews)
                LineChart(monthViews: viewModel.monthViews)
            }
        }
    }
}

struct ChartPreview: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

fileprivate struct ChartsHeader: View {
    var totalViews: Int
    
    var body: some View {
        VStack {
            Text("Youtube Views")
            Text("Total: \(totalViews)")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

fileprivate struct BarChart: View {
    var monthViews: [MonthViews]
    
    var body: some View {
        Chart {
            ForEach(monthViews) { monthView in
                RuleMark(y: .value("Goal", 80000))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [8]))
                    .annotation(alignment: .leading) {
                        Text("Monthly Goal")
                            .font(.caption)
                    }
                
                BarMark(x: .value("Month", monthView.date, unit: .month),
                        y: .value("Views", monthView.viewCount))
                .foregroundStyle(.pink.gradient)
            }
        }
        .frame(height: 200)
        .chartXAxis {
            AxisMarks(values: monthViews.map { $0.date }) { date in
                AxisTick()
                AxisValueLabel(format: .dateTime.month(.narrow))
            }
        }
        .chartYAxis {
            AxisMarks { mark in
                AxisValueLabel()
                AxisGridLine()
            }
        }
        .padding(.bottom)
    }
}

fileprivate struct LineChart: View {
    var monthViews: [MonthViews]
    
    var body: some View {
        Chart(monthViews) { monthView in
            LineMark(x: .value("Goal", monthView.date, unit: .month),
                     y: .value("Views", monthView.viewCount))
        }
        .frame(height: 200)
    }
}
