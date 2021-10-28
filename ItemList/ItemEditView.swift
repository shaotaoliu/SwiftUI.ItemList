import SwiftUI

struct ItemEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: ItemListViewModel
    @State var item: Item
    var operation: Operation = .edit
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $item.name)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Description", text: $item.description)
                    .textFieldStyle(.roundedBorder)
            }
            .navigationTitle("\(operation == .add ? "Add" : "Edit") Item")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                if operation == .add {
                    vm.add(item: item)
                } else {
                    vm.update(item: item)
                }
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
