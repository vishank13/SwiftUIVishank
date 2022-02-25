import SwiftUI

extension Text {
    func dateModifier() -> some View {
        self
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(Color.gray)
    }
    
    func timeModifier() -> some View {
        self
            .font(.footnote)
            .fontWeight(.regular)
            .foregroundColor(Color.gray)
    }
    
    func titleModifier() -> some View {
        self
            .fontWeight(.bold)
            .foregroundColor(Color.green)
            .lineLimit(3)
    }
}

extension View {
    func rowModifier() -> some View {
        self
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.bottom)
    }
}

extension String {
    func getDate() -> String {
        if self.isEmpty {
            return ""
        }
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = df.date(from: self)
        df.dateFormat = "MMM d, yyyy"
        if let parsedDate = date {
            let serverDate = df.string(from: parsedDate)
            return serverDate
        }
        return ""
    }
    
    func getTime() -> String {
        if self.isEmpty {
            return ""
        }
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = df.date(from: self)
        df.dateFormat = "h:mm a"
        if let parsedDate = date {
            let serverDate = df.string(from: parsedDate)
            return serverDate
        }
        return ""
    }
}

