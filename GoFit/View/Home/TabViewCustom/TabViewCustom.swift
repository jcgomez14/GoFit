
import SwiftUI

struct TabViewCustom: View {
    var body: some View {
       TabView{
           HomeView()
               .tabItem {
                   Image(systemName: "house")
                       .resizable()
                       .frame(width: 10, height: 10)
                   Text("Home")
               }
           DiscoveryView()
               .tabItem {
                   Image(systemName: "magnifyingglass")
                       .resizable()
                       .frame(width: 10, height: 10)
                   Text("Discovery")
               }
           Color.black
               .tabItem {
                   Image(systemName: "slider.vertical.3")
                       .resizable()
                       .frame(width: 10, height: 10)
                   Text("Insight")
               }
           Color.white
               .tabItem {
                   Image(systemName: "person")
                       .resizable()
                       .frame(width: 10, height: 10)
                   Text("Profile")
               }
       }
       .accentColor(Color("primary"))
            .navigationBarBackButtonHidden()
            
    }
}

struct TabViewCustom_Previews: PreviewProvider {
    static var previews: some View {
        TabViewCustom()
    }
}
