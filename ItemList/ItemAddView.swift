import SwiftUI

struct ItemAddView: View {
    @State var newItem = Item()
    
    var body: some View {
        ItemEditView(item: newItem, operation: .add)
    }
}

struct ItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        ItemAddView()
    }
}
