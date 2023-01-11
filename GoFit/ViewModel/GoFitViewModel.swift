
import Foundation
import SwiftUI

class GoFitViewModel: ObservableObject {
    @Published var GoFitList = [GoFitModel]()
    
    init(){
        self.GoFitList = GoFitModel.getTraining()
    }
}
