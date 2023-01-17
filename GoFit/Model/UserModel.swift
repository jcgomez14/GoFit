
import Foundation

class UserModel: ObservableObject {
    var sex: String
    var age: Int
    var kg: Int
    var tall: Int

    init(sex: String, age: Int, kg: Int, tall: Int) {
        self.sex = sex
        self.age = age
        self.kg = kg
        self.tall = tall
    }
}
