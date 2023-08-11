//
//  BookmarksViewModel.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 11/08/23.
//

import SwiftUI

@Observable
class BookmarksViewModel {
    var bookmarks: [BookmarkModel] = [] {
        didSet {
            saveBookmarks()
        }
    }

    static let instance = BookmarksViewModel()

    let bookmarksKey = "bookmarks_key"

    private init() {
        guard let data = UserDefaults.standard.data(forKey: bookmarksKey),
              let ourData = try? JSONDecoder().decode([BookmarkModel].self, from: data) else { return }

        bookmarks.append(contentsOf: ourData)
    }

    func saveBookmarks() {
        guard let encodedData = try? JSONEncoder().encode(bookmarks) else { return }
        UserDefaults.standard.set(encodedData, forKey: bookmarksKey)
    }

    func addBookmark(chapterNumber: Int, slokNumber: Int) {
        bookmarks.insert(BookmarkModel(chapterNumber: chapterNumber, slokNumber: slokNumber), at: 0)
    }

    func deleteBookmark(chapterNumber: Int, slokNumber: Int) {
        if let index = bookmarks.firstIndex(where: { $0.chapterNumber == chapterNumber && $0.slokNumber == slokNumber }) {
            bookmarks.remove(at: index)
        }
    }

    func isBookmarked(chapterNumber: Int, slokNumber: Int) -> Bool {
        if let _ = bookmarks.firstIndex(where: { $0.chapterNumber == chapterNumber && $0.slokNumber == slokNumber }) {
            return true
        } else {
            return false
        }
    }
}
