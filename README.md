# SwiftUI.ItemList

This is a simple app that shows how to pass data between views.

![image](https://user-images.githubusercontent.com/15805568/138834899-07c04598-5128-4100-9587-9250941979f0.png)

The new item will be added to the item list. It will be shown in the list when going back to the item list view.

![image](https://user-images.githubusercontent.com/15805568/138834965-a59feca8-f49e-447b-8f9c-3f69f3cfb38a.png)

Clicking one item in the list will pass the item to the item detail view through binding. So when the item in the list is changed, the view detail view will show the latest content.

![image](https://user-images.githubusercontent.com/15805568/138835075-c137fbdc-3825-48f0-a237-b0ac592db004.png)

Clicking the Edit button shows the item edit view. The item is passed from the item detail view to the item edit view by value. If the Cancel button is clicked, the editing will be discarded and the item detail view stays the same. If the Save button is clicked, the change will be saved and the item list will be reloaded. Since the item detail view is bound to the item in the list, it will be refreshed with the new values.

![image](https://user-images.githubusercontent.com/15805568/138835136-10452ee7-33dd-4696-81f5-c8611637f7ab.png)
