
import SwiftUI

struct DiscoveryView: View {
    @ObservedObject private var levelWorkOut = GoFitViewModel()
    @State  var isSearch: Bool = false
    @State var searchTextField = ""
    
    var body: some View {
        NavigationStack {
                VStack {
                    ScrollView(showsIndicators: false) {
                        Discovery(searchTextField: $searchTextField)
                    }
            }.toolbar {
                self.toolBarView()
            }
            
        }.searchable(text: $searchTextField)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}

extension DiscoveryView {
     
    @ToolbarContentBuilder
    func toolBarView() -> some ToolbarContent {
            ToolbarItem(placement: .navigationBarLeading) {
                LogoTabView()
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Discovery")
                    .foregroundColor(Color("text"))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
    }
}

struct Discovery: View {
    @ObservedObject private var levelWorkOut = GoFitViewModel()
    @Binding var searchTextField: String

    var searchResult: [String]  {
        let result = levelWorkOut.GoFitList.map {$0.training.lowercased() }
        return searchTextField == "" ? result : result.filter {$0.contains (searchTextField.lowercased()) }
    }
    
//
//    var result: [GoFitModel] {
//        let lcresult = levelWorkOut.GoFitList.map {$0.training.lowercased()}
//        return searchTextField == "" ? result : result.filter {$0.training.contains(searchTextField)}
//
//    }
    
    
    var body: some View {
        VStack{
            ForEach(levelWorkOut.GoFitList.shuffled()) { item in
                ZStack{
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .fill(LinearGradient(colors: [
                                Color.black,
                                Color.clear,
                                Color.clear,
                            ] , startPoint: .bottom, endPoint: .top))
                        )
                    VStack {
                        Text(item.training)
                            .foregroundColor(Color.white)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.top, 50)
                    }
                    HStack(spacing: 140){
                        Text("\(item.time) | \(item.level)")
                            .font(.system(size: 10, weight: .light))
                            .foregroundColor(Color.white)
                        Button {
                            
                        } label: {
                            Image(systemName: "rectangle.roundedbottom")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(.top, 100)
                }
            }
        }
    }
}
