
import SwiftUI


struct ParentView: View {
    @State private var selectedView = 1
    let months = ["Jan","Feb","March"]
    @State var selectedMonth = "Feb"
    var body: some View {
//        VStack {
//            HStack {
//                Button(action: { self.selectedView = 1 }) {
//                    Text("View 1")
//                }
//                Button(action: { self.selectedView = 2 }) {
//                    Text("View 2")
//                }
//                Button(action: { self.selectedView = 3 }) {
//                    Text("View 3")
//                }
//            }
//            ChildView(selectedView: $selectedView)
//        }
        
        


     
            ZStack {
//                RoundedRectangle(cornerRadius: 5)
//                    .frame(width: UIScreen.main.bounds.size.width-18, height: 32)
//                    .foregroundColor(Color.accentColor)
                
                Picker("", selection: $selectedMonth) {
                    ForEach(months ,id: \.self) {
                        Text($0)
                    }  .accentColor(Color.white)
                }
                .pickerStyle(.wheel)
            }
        
    }
}

struct ChildView: View {
    @Binding var selectedView: Int

    var body: some View {
        Group {
            if selectedView == 1 {
                Text("This is View 1")
            } else if selectedView == 2 {
                Text("This is View 2")
            } else {
                Text("This is View 3")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}


//En este ejemplo, tenemos dos vistas: ParentView y ChildView. En ParentView se tiene un VStack que contiene un HStack donde se encuentran los tres botones con su respectiva acción asociada para cambiar el valor de la variable selectedView. Además se tiene una instancia de ChildView.
//
//En ChildView se tiene una propiedad selectedView declarada con @Binding, esto permite compartir la misma propiedad de estado con la vista padre, ParentView. En la vista hija, se hace uso de un Group y una serie de if-else para mostrar la vista correspondiente en función del valor de la propiedad selectedView.
//
//Con esta estructura, al tocar un boton se mostrara en la vista hija la vista correspondiente.
//
//Es importante mencionar que el Binding es una forma de compartir el estado entre varias vistas, y el State es una forma de almacenar el estado de una vista, juntos estos dos conceptos permiten construir aplicaciones con una interfaz de usuario reactiva en SwiftUI.
//



