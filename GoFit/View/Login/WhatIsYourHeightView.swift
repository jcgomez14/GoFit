
import SwiftUI

struct WhatIsYourHeightView: View {
    @Environment (\.presentationMode) var presentationMode
    @State private var action: Int? = 0
    @State private var selectedHeight: Int? = 80
    
    var body: some View {
        VStack() {
            VStack(alignment: .center) {
                Text("What is Your Height")
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .frame(width: 320)
                    .padding(.bottom, -10)
                Text("Height in cm. Don't worry, you can always change it later.")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .frame(width: 320, height: 50)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            VStack() {
                Picker("", selection: $selectedHeight) {
                    ForEach(120..<210) {
                        Text("\($0)").tag($0)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(Color("primary"))
                        
                    }
                }.pickerStyle(InlinePickerStyle())
            
            }
            
            Spacer()
 
            HStack {
                //MARK: Button Back
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Back")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .bold))
                            .frame(width: 150, height: 50)
                            .background(Color("third"))
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    }
                
                //MARK: Button Continue
                NavigationLink(destination: TabViewCustom(), tag: 2, selection: $action) {
                    Button {
                        self.action = 2
                    } label: {
                        Text("Continue")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .bold))
                            .frame(width: 150, height: 50)
                            .background(Color("primary"))
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .shadow(radius: 10)
                    }
                }
            }
            
            
        }.navigationBarBackButtonHidden()
    }
}

struct WhatIsYourHeightView_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsYourHeightView()
    }
}
