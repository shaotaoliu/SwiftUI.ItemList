# SwiftUI.ItemList

This simple app shows how to pass data between views. The main screen shows a list of items.

![image](https://user-images.githubusercontent.com/15805568/138834899-07c04598-5128-4100-9587-9250941979f0.png)

Tapping the Add button shows the ItemAddView.

![image](https://user-images.githubusercontent.com/15805568/138834965-a59feca8-f49e-447b-8f9c-3f69f3cfb38a.png)


```swift
ItemAddView()
```

In ItemAddView, a new item is instantiated and passed to ItemEditView by value.

```swift
ItemEditView(item: newItem, operation: .add)
```

Clicking one item in the list of the main screen will pass the item to ItemDetailView by binding. So when the item in the list is changed, it will be published in ItemDetailView.

```swift
ItemDetailView(item: $vm.items[vm.items.firstIndex(where: { $0.id == item.id })!])
```

![image](https://user-images.githubusercontent.com/15805568/138835075-c137fbdc-3825-48f0-a237-b0ac592db004.png)

Clicking the Edit button shows ItemEditView which is also used by ItemAddView (to reduce redundant code). The item in ItemEditView is a copy of the item in ItemAddView and ItemDetailView. When the Cancel button is tapped, it will be discarded and the change does not affect the item in ItemAddView and ItemDetailView.

```swift
ItemEditView(item: item)
```

![image](https://user-images.githubusercontent.com/15805568/138835136-10452ee7-33dd-4696-81f5-c8611637f7ab.png)

When the Save button is tapped, the item in ItemEditView is saved and the item list in the view model is updated.
1. For an add operation, the new item is added to the item list. The main screen will show the new item.
2. For an edit operation, the item in the item list is updated. Since the item in the list is bound to the item in ItemDetailView. ItemDetailView will show the updated item.

