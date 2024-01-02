import Foundation
import SwiftData

@Model
class Book {  init
    (title: String,
     author: String,
     genre: String,
     review: String,
     rating: Int) {
    self.title = title
    self.author = author
    self.genre = genre
    self.review = review
    self.rating = rating
}
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date = Date.now
}
