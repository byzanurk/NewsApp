//
//  String+DateFormatter.swift
//  NewsApp
//
//  Created by Beyza Nur Tekerek on 4.10.2025.
//

import Foundation

extension String {
    
    func toRelativeDateString(from format: String? = nil) -> String {
        let dateFormatter = DateFormatter()
        
        if let format = format {
            dateFormatter.dateFormat = format
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        }
        
        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        
        return date.toRelativeString()
    }
}

extension Date {

    func toRelativeString() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .weekOfYear, .day, .hour, .minute, .second],
                                               from: self, to: now)
        
        if let years = components.year, years > 0 {
            return years == 1 ? "1 year ago" : "\(years) years ago"
        }
        
        if let months = components.month, months > 0 {
            return months == 1 ? "1 month ago" : "\(months) months ago"
        }
        
        if let weeks = components.weekOfYear, weeks > 0 {
            return weeks == 1 ? "1 week ago" : "\(weeks) weeks ago"
        }
        
        if let days = components.day, days > 0 {
            return days == 1 ? "1 day ago" : "\(days) days ago"
        }
        
        if let hours = components.hour, hours > 0 {
            return hours == 1 ? "1 hour ago" : "\(hours) hours ago"
        }
        
        if let minutes = components.minute, minutes > 0 {
            return minutes == 1 ? "1 minute ago" : "\(minutes) minutes ago"
        }
        
        if let seconds = components.second, seconds > 30 {
            return "\(seconds) seconds ago"
        }
        
        return "Just now"
    }
}
