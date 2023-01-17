
import SwiftUI

struct HowOldAreYouView: View {
    @State private var action: Int? = 0
    @State private var selectedAge: Int? = 0
    @Environment (\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack(alignment: .center) {
                    Text("How Old Are You?")
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .frame(width: 320)
                        .padding(.bottom, -10)
                    Text("Age in years. This will help us to personalize an exercise program plan that suits you.")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .frame(width: 320, height: 50)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack() {
                    Picker("", selection: $selectedAge) {
                        ForEach(15..<90) {
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
                    NavigationLink(destination: WhatIsYourWeightView(), tag: 2, selection: $action) {
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
                
            }
        }.navigationBarBackButtonHidden()
    }
}

struct HowOldAreYouView_Previews: PreviewProvider {
    static var previews: some View {
        HowOldAreYouView()
    }
}
