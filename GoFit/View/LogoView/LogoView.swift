

import SwiftUI

struct LogoView: View {
    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("primary"))
                .frame(width: 75, height: 65)
            Image(systemName: "dumbbell.fill")
                .resizable()
                .frame(width: 50, height: 40)
                .foregroundColor(Color.white)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoTabView()
    }
}



struct LogoTabView: View {
    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color("primary"))
                .frame(width: 30, height: 25)
            Image(systemName: "dumbbell.fill")
                .resizable()
                .frame(width: 15, height: 10)
                .foregroundColor(Color.white)
        }
    }
}
