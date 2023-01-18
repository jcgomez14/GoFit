
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
           InsigthView()
               .tabItem {
                   Image(systemName: "slider.vertical.3")
                       .resizable()
                       .frame(width: 10, height: 10)
                   Text("Insight")
               }
           ProfileView()
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
