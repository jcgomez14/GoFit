
import SwiftUI

struct BottomSheetView: View {
    @ObservedObject private var levelWorkOut = GoFitViewModel()
    var body: some View {
        ZStack {
            Color("primary").opacity(0.8)
                .ignoresSafeArea()
        
        VStack(spacing: 30) {
            Spacer()
            VStack(spacing: 6) {
                Text("Are you ready?")
                    .foregroundColor(Color.white)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                HStack {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.white)
                    Text("Remember to have water nearby")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                }
            }
            Spacer()
            Button {
            
            } label: {
                Text("Start")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 14, weight: .bold))
                    .frame(width: 150, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .shadow(radius: 10)
            }
            Spacer()
            }
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
