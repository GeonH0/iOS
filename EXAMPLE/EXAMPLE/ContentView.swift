import SwiftUI

struct ContentView: View {
    @State private var selectedItem = 1
    @State private var shouldShowActionSheet = false
    @State private var oldSelectedItem = 1

    var body: some View {
        TabView (selection: $selectedItem) {
            Text("Home")
                .tabItem { Image(systemName: "house") }
                .tag(1)
                .onAppear { self.oldSelectedItem = self.selectedItem }
            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(2)
                .onAppear { self.oldSelectedItem = self.selectedItem }
            
            Text("Add")
                .tabItem { Image(systemName: "plus.circle") }
                .tag(3)
                .onAppear {
                    self.shouldShowActionSheet.toggle()
                    self.selectedItem = self.oldSelectedItem
                }
            
            Text("Heart")
                .tabItem { Image(systemName: "heart") }
                .tag(4)
                .onAppear { self.oldSelectedItem = self.selectedItem }
            Text("Profile")
                .tabItem { Image(systemName: "person.crop.circle") }
                .tag(5)
                .onAppear { self.oldSelectedItem = self.selectedItem }
        }
        .actionSheet(isPresented: $shouldShowActionSheet) { ActionSheet(title: Text("Title"), message: Text("Message"), buttons: [.default(Text("Option 1"), action: option1), .default(Text("Option 2"), action: option2) , .cancel()]) }
    }

    func option1() {
        // do logic 1
    }

    func option2() {
        // do logic 2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
