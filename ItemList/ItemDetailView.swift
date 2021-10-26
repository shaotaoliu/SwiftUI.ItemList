import SwiftUI

struct ItemDetailView: View {
    @State var showSheet = false
    @Binding var item: Item
    
    var body: some View {
        VStack {
            Form {
                Text(item.name)
                Text(item.description)
            }
            .navigationTitle("Item Detail")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: EditButton)
        }
    }
    
    var EditButton: some View {
        Button("Edit") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ItemEditView(item: item)
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: .constant(Item(name: "Example", description: "This is an example")))
    }
}
