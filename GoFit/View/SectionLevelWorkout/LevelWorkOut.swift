
import SwiftUI

struct LevelWorkOut: View {
    @ObservedObject private var levelWorkOut = GoFitViewModel()
    var body: some View {

            ForEach(levelWorkOut.GoFitList.shuffled()) { item in
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
                        print("guardar")
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

struct LevelWorkOut_Previews: PreviewProvider {
    static var previews: some View {
        SectionLevelWorkout()
    }
}

struct SectionLevelWorkout: View {
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
                    
                } label: {
                    Text("Beginner")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 14, weight: .bold))
                    }
                .frame(width: 110, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("primary"), lineWidth: 2))
                
                Button {
                    
                } label: {
                    Text("Intermediate")
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .bold))
                }
                .frame(width: 110, height: 30)
                .background(Color("primary"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("primary"), lineWidth: 2))

                
                Button {
                    
                } label: {
                    Text("Advance")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 14, weight: .bold))
                }
                .frame(width: 110, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("primary"), lineWidth: 2))
            }
        }
    }
}
