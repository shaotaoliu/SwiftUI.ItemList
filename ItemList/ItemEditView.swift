import SwiftUI

struct ItemEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: ItemListViewModel
    @State var item: Item
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $item.name)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Description", text: $item.description)
                    .textFieldStyle(.roundedBorder)
            }
            .navigationTitle("Edit Item")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                vm.update(item: item)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct ItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        ItemEditView(item: Item(name: "Example", description: "This is an example"))
            .environmentObject(ItemListViewModel())
    }
}
