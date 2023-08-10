//
//  ContentView.swift
//  CountryAppSwiftUI
//
//  Created by Khushboo on 14/09/22.
//

import SwiftUI
import Combine

struct ContentView: View {
   // @Environment(\.managedObjectContext) private var viewContext
   
    @Environment(\.presentationMode) var presentationMode
    @State var country1: String = ""
    @State var userArr: Array = []
    @Binding var isShowing: Bool
    @State private var showNewItem: Bool = false
    private var isButtonDisabled: Bool{
        country1.isEmpty
    }
    //Function
  func addItem() {
      withAnimation{
      countryStore.name.append(countries(id: String(countryStore.name.count + 1), country: country1))
      //presentationMode.wrappedValue.dismiss()
         
        //  isShowing = false
      let _ = print(country1)
      }
       /*  withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timeStamp = Date()
            newItem.task = task {
                newItem.completion = false
                newItem.id  = UUID()
                do{
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("unsolved error\(nsError),\(nsError.userInfo)")
                }
                country = ""
                hideKeyboard()
            }
        }*/
    }
   @ObservedObject var countryStore = CountryStore()
    var body: some View {
        
        NavigationView{
        
            ZStack{
                Color((UIColor.systemGray4))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                VStack{
                TextField("Add Country", text: $country1)
                    .padding(.all)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    //action
                    Button(action: {
                        addItem()
                        MyLocalStorage.myValue = self.country1
                        userArr.append(country1)
                        
                    }
                 , label: {
                    Spacer()
                    
                        Text("Add Country")
                    Spacer()
                }).disabled(isButtonDisabled)
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(isButtonDisabled ? Color.blue: Color.pink).cornerRadius(10)
                   
                    Button(action: {
                        userArr.append(country1)
                    }
                       , label: {
                        Spacer()
                        NavigationLink("Show All Country", destination: ShowName())
                        
                        Spacer()
                        
                    }).disabled(isButtonDisabled)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isButtonDisabled ? Color.blue: Color.pink).cornerRadius(10)
                    }
                        .navigationBarTitle("Country App")
                }.cornerRadius(16)
                    .shadow(color: Color(red: 0, green: 0, blue: 0 , opacity: 0.65), radius: 24)
                    .frame(maxWidth: 640)
            }
            

        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(isShowing: .constant(true))
   }
}
