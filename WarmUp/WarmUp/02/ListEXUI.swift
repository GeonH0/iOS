//
//  ListEXUI.swift
//  WarmUp
//
//  Created by 김건호 on 2023/10/16.
//

import SwiftUI


struct Fruit : Hashable {
    let name : String
    let matchFruitName : String
    let price : Int
}




struct ListEXUI: View {
    
    @State var favoriteFruits = [
    Fruit(name: "Apple", matchFruitName: "Banana", price: 1000),
    Fruit(name: "Banana", matchFruitName: "Banana", price: 3000),
    Fruit(name: "Cherry", matchFruitName: "Double Kiwi", price: 4000),
    Fruit(name: "Double Kiwi", matchFruitName: "Elder bery", price: 2400),
    Fruit(name: "Elder bery", matchFruitName: "Double Kiwi", price: 8000)
    ]
    
    var fruits = ["Apple", "Banana", "Cherry", "Double Kiwi","Elder bery"]
    var Matchfruits = ["Banana", "Banana", "Double Kiwi", "Elder bery","Double Kiwi"]
    var price = ["1000","3000","4000","2400","8000"]
    
    var count = 0
    
    @State var fruitName : String = ""
    
    var body: some View {
        NavigationStack{
            
            VStack{
                HStack{
                    TextField("insert fruit name", text: $fruitName)
                    Button{
                        favoriteFruits.append(Fruit(name: fruitName, matchFruitName: "Apple", price: 1000))
                    } label: {
                        Text("insert")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    
                }
                .padding()
            
                List {
                    ForEach(favoriteFruits, id: \.self) { fruits in
                        VStack(alignment: .leading) {
                            Text("name : \(fruits.name)")
                            Text("match : \(fruits.matchFruitName)")
                            Text("price : \(fruits.price)")
                        }
                    }.onDelete{IndexSet in
                        favoriteFruits.remove(atOffsets: IndexSet)
                        //list에서 기본적으로 delete해주는 기능 스와이프 기능으로
                    }
            }
            .navigationTitle("Fruit List")
        }
    }
    }
}

struct ListEXUI_Previews: PreviewProvider {
    static var previews: some View {
        ListEXUI()
    }
}
