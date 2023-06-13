import Foundation

public extension Date {
    
   func strForFormatter(_ formatter: YWDateFormatterType) -> String {
        let dformatter = DateFormatter()
        dformatter.dateFormat = formatter.rawValue
        return dformatter.string(from: self)
    }
    
}

public enum YWDateFormatterType: String {
    case mdy = "MM/dd/yyyy"
    case hourMinute = "HH:mm"
    case md = "MM/dd"
}

