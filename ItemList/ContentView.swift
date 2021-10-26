import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ItemListViewModel
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.items, id: \.id) { item in
                    NavigationLink(destination: ItemDetailView(item: $vm.items[vm.items.firstIndex(where: { $0.id == item.id })!])) {
                        Text(item.name)
                    }
                }
                .onDelete { indexSet in
                    vm.delete(offsets: indexSet)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Items")
            .navigationBarItems(leading: AddButton, trailing: EditButton())
        }
    }
    
    var AddButton: some View {
        Button("Add") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ItemAddView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ItemListViewModel())
    }
}
