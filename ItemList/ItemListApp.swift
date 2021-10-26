import SwiftUI

@main
struct ItemListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ItemListViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
