
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                    greetingUser
                SectionTitleWorkoutFeatured()
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 5){
                        FeaturedWorkoutCard()
                        FeaturedWorkoutCard()
                        FeaturedWorkoutCard()
                        FeaturedWorkoutCard()
                    }.padding(.leading)
                }
                    SectionLevelWorkout()
                }.toolbar{
                    self.toolBarView()
                    
            }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    @ToolbarContentBuilder
    func toolBarView() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            LogoTabView()
        }
        ToolbarItem(placement: .navigationBarLeading) {
            Text("GoFit")
                .foregroundColor(Color("text"))
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "bell")
                .resizable()
                .frame(width: 18, height: 20)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "")
                .resizable()
                .frame(width: 18, height: 20)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "rectangle.roundedbottom")
                .resizable()
                .frame(width: 18, height: 20)
        }
    }
    
    var greetingUser: some View {
        VStack (){
            Text("Morning, Christina 👋")
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .frame(width: 360, height: 35, alignment: .leading)
        }
    }
    

}
