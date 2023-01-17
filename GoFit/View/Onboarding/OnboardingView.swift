
import SwiftUI

struct OnboardingView: View {
    @State var showOnboarding = true
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                Image("training4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 900)
                    .overlay(Rectangle()
                        .fill(LinearGradient(colors: [Color.black, Color.clear
                                                     ], startPoint: .bottom, endPoint: .top)))
                VStack(alignment: .leading, spacing: -10) {
                    Text("Welcome to 👋")
                        .foregroundColor(Color.white)
                        .font(.system(size: 45, weight: .bold, design: .rounded))
                        .frame(width: 400, alignment: .leading)
                    Text("GoFit")
                        .foregroundColor(Color.white)
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                        .frame(width: 350, alignment: .leading)
                        
                }.padding(.top, -300)
                    .padding(.leading, 50)
                VStack{
                    Text("The best fitness app in this century to accompany your sports")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                        .frame(width: 350, height: 100, alignment: .leading)
                }.padding(.top, -190)
                    .padding(.leading, 20)
            }
        }
        .onTapGesture {
            showOnboarding = true
        }
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingViewPage()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewPage()
    }
}


struct OnboardingViewPage: View {
        var body: some View {
        
        TabView {
            onboardingfirst
            
            Text("second")
            
            Text("third")
        }.tabViewStyle(PageTabViewStyle())
                .edgesIgnoringSafeArea(.all)
    }
}


extension OnboardingViewPage {
    var onboardingfirst: some View {
        ZStack(alignment: .bottom){
            Image("training1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 500)
                .clipShape(Rectangle())
                .padding(.leading, -310)
                .padding(.top, -390)
            VStack() {
                Text("Find the right workout for what you need")
                    .foregroundColor(Color("text"))
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .padding(.bottom)
                    
            }
        }
    }
    
    
}
 
