import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(rating: .constant(3))
        }
        .modelContainer(for: Book.self)
    }
}
