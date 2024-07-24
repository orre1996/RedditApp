//
//  Date+Extensions.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

extension Date {
    static func setTime(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, min: Int? = nil, sec: Int? = nil, timeZoneAbbrev: String = "UTC") -> Date? {
        let calendarComponent: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let calendar = Calendar.current
        var components = calendar.dateComponents(calendarComponent, from: Date())
        
        components.timeZone = TimeZone(abbreviation: timeZoneAbbrev)
        components.year = year ?? components.year
        components.month = month ?? components.month
        components.day = day ?? components.day
        components.hour = hour ?? components.hour
        components.minute = min ?? components.minute
        components.second = sec ?? components.second
        
        return calendar.date(from: components)
    }
}
