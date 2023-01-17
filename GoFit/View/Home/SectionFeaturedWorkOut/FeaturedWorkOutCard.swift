

import SwiftUI

struct FeaturedWorkoutCard: View {
    @ObservedObject private var featuredWorkOut = GoFitViewModel()
    
    var body: some View {
        ForEach(featuredWorkOut.GoFitList.shuffled()) { item in
            ZStack() {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .fill(LinearGradient(colors: [
                            Color.black,
                            Color.clear,
                            Color.clear
                        ], startPoint: .bottom, endPoint: .top)))
                VStack {
                    Text(item.training)
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 200)
                        .multilineTextAlignment(.center)
                        .padding(.top, 100)
                }
                HStack(spacing: 20){
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
                .padding(.top, 150)
            }
        }
    }
}

struct FeaturedWorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedWorkoutCard()
    }
}



struct SectionTitleWorkoutFeatured: View {
    var body: some View {
        HStack(spacing: 150){
            Text("Featured Workout")
                .font(.system(size: 20, weight: .bold, design: .rounded))
            Button {
            } label: {
                Text("See All")
                    .foregroundColor(Color("secondary"))
                    .font(.system(size: 13, weight: .bold, design: .rounded))
            }

        }
    }
    
}
