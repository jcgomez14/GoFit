
import SwiftUI

struct TellUsAboutYourselfView: View {
    @State private var  isSelected = 1
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .center) {
                    Text("Tell Us About Yourself")
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .frame(width: 320)
                        .padding(.bottom, -10)
                    Text("To give you a better experience and results we need to know your gender.")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .frame(width: 320, height: 50)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
                Button(action: {
                    print("Pressed!")
                    isSelected = 1
                }){
                    Text("Male")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 300, height: 200)
                        .foregroundColor(Color.white)
                        .background(isSelected == 1 ? Color("primary") : Color.gray)
                        .clipShape(Circle())
                }.buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    print("Pressed!")
                    isSelected = 2
                }){
                    Text("Female")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 300, height: 200)
                        .foregroundColor(Color.white)
                        .background(isSelected == 2 ? Color("primary") : Color.gray)
                        .clipShape(Circle())
                }.buttonStyle(PlainButtonStyle())
                Spacer()
                
                //MARK: Button Continue
                NavigationLink(destination: HowOldAreYouView(), tag: 1, selection: $action) {
                    Button {
                        self.action = 1
                        
                    } label: {
                        
                        Text("Continue")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .bold))
                            .frame(width: 300, height: 50)
                            .background(Color("primary"))
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .shadow(radius: 10)
                    }
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

struct TellUsAboutYourselfView_Previews: PreviewProvider {
    static var previews: some View {
        TellUsAboutYourselfView()
    }
}
