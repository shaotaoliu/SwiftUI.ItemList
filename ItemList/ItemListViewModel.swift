import Foundation

class ItemListViewModel: ObservableObject {
    @Published var items: [Item] = []
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        for i in 1...6 {
            items.append(Item(name: "Item \(i)", description: "This is item \(i)"))
        }
    }
    
    func add(item: Item) {
        items.append(item)
    }
    
    func update(item: Item) {
        let index = items.firstIndex(where: { $0.id == item.id })!
        
        items[index].name = item.name
        items[index].description = item.description
    }
    
    func delete(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct Item {
    let id = UUID()
    var name: String
    var description: String
}
