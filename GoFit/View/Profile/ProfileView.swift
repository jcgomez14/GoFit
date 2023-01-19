
import SwiftUI

struct ProfileView: View {
    @State private var toogle = false
    
    var body: some View {
        NavigationStack {
            VStack {
                profileHeader
                cardPremium
                settingProfile
                Spacer()
            }.toolbar{
                self.toolBarView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView {
    
    @ToolbarContentBuilder
    func toolBarView() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            LogoTabView()
        }
        ToolbarItem(placement: .navigationBarLeading) {
            Text("Profile")
                .foregroundColor(Color("text"))
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "")
                .resizable()
                .frame(width: 18, height: 20)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "ellipsis")
                .resizable()
                .frame(width: 20, height: 5)
        }
    }
  
    var profileHeader: some View {
        VStack(spacing: -30) {
            Image("profile")
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 150)
                .padding()
            VStack {
                Text("Christina Ainsley")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text("christinaainsley@yourdomine.com")
                    .tint(Color.black)
                    .font(.system(size: 14))

            }
            
        }
    }
    
    var cardPremium: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(LinearGradient(colors: [Color("primary"),
                                                  Color("primary"),
                                                  Color("secondary")
                                                 ], startPoint: .trailing, endPoint: .leading))
                    .frame(width: 320, height: 100)
                    .shadow(radius: 8)
                VStack{
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.yellow)
                                .frame(width: 50, height: 30)
                            Text("PRO")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                        }
                        Text("Upgrade to Premium")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                        Image(systemName: "arrow.forward")
                            .foregroundColor(Color.white)
                        
                    }
                    
                    Text("Enjoy workout access whitout ads and restrictions")
                        .foregroundColor(Color.white)
                        .font(.system(size: 10, design: .rounded))
                }
            }
            .padding()
            Divider()
        }

    }
    
    var settingProfile: some View  {
        VStack {
            List {
                HStack(spacing: 20) {
                    Image(systemName: "square.and.pencil")
                    Text("Edit Profile")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                
                HStack(spacing: 20) {
                    Image(systemName: "bell")
                    Text("Notifications")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                
                HStack(spacing: 20) {
                    Image(systemName: "lock.circle")
                    Text("Security")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                
                HStack(spacing: 20) {
                    Image(systemName: "questionmark.circle")
                    Text("Help")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                
                HStack(spacing: 20) {
                    Image(systemName: "eye")
                    Text("Dark Theme")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                    Toggle("", isOn: $toogle)
                        .toggleStyle(SwitchToggleStyle(tint: Color("primary")))
                }
                
                HStack(spacing: 20) {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(Color.red)
                    Text("Logout")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.red)
                }
            }.listStyle(.plain)
        }
    }
}
