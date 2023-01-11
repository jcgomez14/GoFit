
import Foundation

struct GoFitModel: Identifiable {
    let id = UUID()
    var training: String
    var level: String
    var image: String
    var time: String
    
    static func getTraining() -> [GoFitModel] {
        return [
            .init(training: "Running", level: "Beginner", image: "training12", time: "18 minutes"),
            .init(training: "Full Body Stretching", level: "Beginner", image: "training8", time: "15 minutes"),
            .init(training: "Dumbbell Exercise", level: "Beginner", image: "training9", time: "14 minutes"),
            .init(training: "Full Body Stretching", level: "Intermediate", image: "training2", time: "10 minutes"),
            .init(training: "Squat Movement Exercise", level: "Intermediate", image: "training4", time: "12 minutes"),
            .init(training: "Abdominal Exercise", level: "Intermediate", image: "training3", time: "14 minutes"),
            .init(training: "Full Body Stretching", level: "Advanced", image: "training1", time: "23 minutes"),
            .init(training: "Dumbbell Exercise", level: "Advanced", image: "training6", time: "20 minutes"),
            .init(training: "Push up Training", level: "Advanced", image: "training5", time: "35 minutes")
        ]
    }
    
}
