import Foundation

extension Date {
    public func format(_ format: String,
                       timeZone: TimeZone,
                       locale: Locale) -> String {
        let f = DateFormatter()
        f.calendar = Calendar(identifier: .gregorian)
        f.dateFormat = format
        f.timeZone = timeZone
        f.locale = locale
        return f.string(from: self)
    }

    public static func +(a: Date, b: TimeInterval) -> Date {
        a.addingTimeInterval(b)
    }
    
    public static func +=(a: inout Date, b: TimeInterval) {
        a = a + b
    }
    
    public static func -(a: Date, b: TimeInterval) -> Date {
        a.addingTimeInterval(-b)
    }
    
    public static func -=(a: inout Date, b: TimeInterval) {
        a = a - b
    }
    
    public static func -(a: Date, b: Date) -> TimeInterval {
        a.timeIntervalSince(b)
    }
}
