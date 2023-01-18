
import SwiftUI

struct InsigthView: View {
    @ObservedObject private var levelWorkOut = GoFitViewModel()
    @StateObject var calendarModel: GoFitViewModel = GoFitViewModel()
    @Namespace var animation
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                CalendarView
                Spacer()
                statics
                activity
                Spacer()
            }.toolbar{
                self.toolBarView()
            }
        }
    }
}


struct InsigthView_Previews: PreviewProvider {
    static var previews: some View {
        InsigthView()
    }
}

extension InsigthView {
    
    @ToolbarContentBuilder
    func toolBarView() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            LogoTabView()
        }
        ToolbarItem(placement: .navigationBarLeading) {
            Text("Insight")
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
    
    
    
    var CalendarView: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center) {
                ForEach(calendarModel.currentWeek, id: \.self) { day in
                    VStack(spacing: 10) {
                        
                        Text("\(calendarModel.extractDate(date: day, format: "dd"))")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                        
                        Text("\(calendarModel.extractDate(date: day, format: "EEE"))")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 8, height: 8)
                            .opacity(calendarModel.isToday(date: day) ? 1 : 0)
                    }
                    .foregroundStyle(calendarModel.isToday(date: day) ? .primary : .secondary)
                    .foregroundColor(calendarModel.isToday(date: day) ? Color.white : Color("primary"))
                    .frame(width: 45, height: 90)
                    .background {
                        ZStack {
                            if calendarModel.isToday(date: day) {
                                Capsule()
                                    .fill(Color("primary"))
                                    .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                
                            } else {
                                Capsule()
                                    .fill(Color.black).opacity(0.2)
                            }
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation {
                            calendarModel.currentDay = day
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    var statics: some View {
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .stroke(Color("third"), lineWidth: 15)
                    .frame(height: 150)
                
                Circle()
                    .trim(from: 0, to: levelWorkOut.circleFill(int: levelWorkOut.GoFitFinishList[1].cal))
                    .stroke(Color("primary"), lineWidth: 15)
                    .frame(height: 150)
                    .rotationEffect(.init(degrees: -90))
                
                VStack{
                    Text("\(levelWorkOut.GoFitFinishList[1].cal)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Text("cal")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            HStack(spacing: 35) {
                ZStack {
                    Circle()
                        .stroke(Color("third"), lineWidth: 10)
                        .frame(height: 100)
                    
                    Circle()
                        .trim(from: 0, to: levelWorkOut.circleFill(int: levelWorkOut.GoFitFinishList[1].workout))
                        .stroke(Color("secondary"), lineWidth: 10)
                        .frame(height: 100)
                        .rotationEffect(.init(degrees: -90))
                    
                    
                    VStack{
                        Text("\(levelWorkOut.GoFitFinishList[1].workout)")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                        Text("workout")
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                    }
                    
                }
                
                ZStack {
                    Circle()
                        .stroke(Color("third"), lineWidth: 10)
                        .frame(height: 100)
                    
                    Circle()
                        .trim(from: 0, to: levelWorkOut.circleFill(int: levelWorkOut.GoFitFinishList[1].time))
                        .stroke(Color("secondary"), lineWidth: 10)
                        .frame(height: 100)
                        .rotationEffect(.init(degrees: -90))
                    
                    VStack{
                        Text("\(levelWorkOut.GoFitFinishList[1].time)")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                        Text("minutes")
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                    }
                }

                ZStack {
                    Circle()
                        .stroke(Color("third"), lineWidth: 10)
                        .frame(height: 100)
                    
                    Circle()
                        .trim(from: 0, to: levelWorkOut.circleFill(int: levelWorkOut.GoFitFinishList[1].bpm))
                        .stroke(Color("secondary"), lineWidth: 10)
                        .frame(height: 100)
                        .rotationEffect(.init(degrees: -90))
                    
                    VStack{
                        Text("\(levelWorkOut.GoFitFinishList[1].bpm)")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                        Text("bpm")
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                    }
                }
            }
            .padding(EdgeInsets(top: -5, leading: 20, bottom: 0, trailing: 20))
        }
    }
    
    var activity: some View {
        
        VStack {
            VStack() {
                Text("Finished Workout")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            ZStack{
                Image(levelWorkOut.GoFitList[1].image)
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
                    Text(levelWorkOut.GoFitList[1].training)
                        .foregroundColor(Color.white)
                        .font(.system(size: 22, weight: .semibold))
                        .padding(.top, 50)
                }
                HStack(spacing: 140){
                    Text("\(levelWorkOut.GoFitList[1].time) | \(levelWorkOut.GoFitList[1].level)")
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
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}
