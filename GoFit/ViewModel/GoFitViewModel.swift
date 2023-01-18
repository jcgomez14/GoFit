
import Foundation
import SwiftUI

class GoFitViewModel: ObservableObject {
    @Published var GoFitList = [GoFitModel]()
    @Published var GoFitFinishList = [GoFitModel.FinishWork]()
    @Published var currentWeek: [Date] = []
    @Published var currentDay: Date = Date()
    
    func fetchCurrentWeek() {
        
        let today = Date()
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else { return }
        
        
        (1...7).forEach { day in
            
            if let weekday = calendar.date(byAdding: .day, value: day ,to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
    
    func circleFill(int: Int) -> CGFloat {
        
        let circleFill = CGFloat(int) * 0.01 / 1
        print("circlefill", circleFill)
        return circleFill
    }
    
    
    init(){
        self.GoFitList = GoFitModel.getTraining()
        self.GoFitFinishList = GoFitModel.FinishWork.getFinish()
        fetchCurrentWeek()
    }
    
    
    
}
