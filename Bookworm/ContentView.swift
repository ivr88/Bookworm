import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Book.title, order: .reverse)]) var books: [Book]
    @State private var showingAddScreen = false
    
    @Binding var rating: Int
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
               .navigationTitle("Bookworm")
               .toolbar {
                   ToolbarItem(placement: .topBarTrailing) {
                       Button("Add Book", systemImage: "plus") {
                           showingAddScreen.toggle()
                       }
                   }
                   ToolbarItem(placement: .topBarLeading) {
                       EditButton()
                   }
               }
               .sheet(isPresented: $showingAddScreen) {
                   AddBookView()
            }
               .navigationDestination(for: Book.self) { book in
                   DetailView(book: book)
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView(rating: .constant(3))
}
