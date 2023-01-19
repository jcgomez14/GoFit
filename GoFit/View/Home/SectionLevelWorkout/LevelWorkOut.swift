
import SwiftUI

struct LevelWorkOut: View {
    @ObservedObject private var levelWorkOut = GoFitViewModel()
    @Binding var selectedView: Int
    @State var presentView: Bool = false
    
    
    
    var body: some View {
        let beginner =  levelWorkOut.GoFitList.filter {$0.level == "Beginner"}
        let intermediate = levelWorkOut.GoFitList.filter {$0.level == "Intermediate"}
        let advanced = levelWorkOut.GoFitList.filter { $0.level == "Advanced" }
        
        ScrollView(showsIndicators: false) {
            if  selectedView == 1 {
                cardLevel(level: beginner, presentView: presentView)
            } else if selectedView == 2 {
                cardLevel(level: intermediate, presentView: presentView)
            } else if selectedView == 3 {
                cardLevel(level: advanced, presentView: presentView)
            }
        }
        .sheet(isPresented: $presentView) {
            BottomSheetView()
                .presentationDetents([.medium])
        }
        
    }
}

extension LevelWorkOut {
    //MARK: Card View
    func cardLevel(level: [GoFitModel],  presentView: Bool) -> some  View {
        
        return ForEach(level) { item in
            Button {
                self.presentView.toggle()
            } label: {
                ZStack{
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .fill(LinearGradient(colors: [
                                Color.black,
                                Color.clear,
                                Color.clear,
                            ] , startPoint: .bottom, endPoint: .top))
                        )
                    VStack {
                        Text(item.training)
                            .foregroundColor(Color.white)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.top, 50)
                    }
                    HStack(spacing: 140){
                        Text("\(item.time) | \(item.level)")
                            .font(.system(size: 10, weight: .light))
                            .foregroundColor(Color.white)
                        Button {
                            
                        } label: {
                            Image(systemName: "rectangle.roundedbottom")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(.top, 100)
                }
            }
        }
    }
    
}



struct SectionLevelWorkout: View {
    @State private var selectedView = 1

    
    var body: some View {
        VStack{
            HStack(spacing: 150){
                Text(" Workout Levels")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Button {
                    
                } label: {
                    Text("See All")
                        .foregroundColor(Color("secondary"))
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                }
            }
            HStack(spacing: 8){
                Button {
                    selectedView = 1
                    
                } label: {
                    Text("Beginner")
                        .foregroundColor(selectedView == 1 ? Color.white : Color("primary"))
                        .font(.system(size: 14, weight: .bold))
                    }
                .frame(width: 110, height: 30)
                .background(selectedView == 1 ? Color("primary") : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("primary"), lineWidth: 2))
                
                Button {
                    selectedView = 2
            
                } label: {
                    Text("Intermediate")
                        .foregroundColor(selectedView == 2 ? Color.white : Color("primary"))
                        .font(.system(size: 14, weight: .bold))
                }
                .frame(width: 110, height: 30)
                .background(selectedView == 2 ? Color("primary") : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("primary"), lineWidth: 2))

                
                Button {
                    selectedView = 3

                } label: {
                    Text("Advance")
                        .foregroundColor(selectedView == 3 ? Color.white : Color("primary"))
                        .font(.system(size: 14, weight: .bold))
                }
                .frame(width: 110, height: 30)
                .background(selectedView == 3 ? Color("primary") : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("primary"), lineWidth: 2))
            }
            LevelWorkOut(selectedView: $selectedView)
        }
    }
}


struct LevelWorkOut_Previews: PreviewProvider {
    static var previews: some View {
        SectionLevelWorkout()
    }
}
