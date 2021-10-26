import SwiftUI

struct ItemAddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: ItemListViewModel
    @State var newItem = Item(name: "", description: "")
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $newItem.name)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Description", text: $newItem.description)
                    .textFieldStyle(.roundedBorder)
            }
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                vm.add(item: newItem)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct ItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        ItemAddView()
            .environmentObject(ItemListViewModel())
    }
}
