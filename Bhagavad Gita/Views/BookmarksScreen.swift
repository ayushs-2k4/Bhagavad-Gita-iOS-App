//
//  BookmarksView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 11/08/23.
//

import SwiftUI

struct BookmarksScreen: View {
    let bookmarksViewModel = BookmarksViewModel.instance
    @Binding var isEnglish: Bool

    init(isEnglish: Binding<Bool>) {
        _isEnglish = isEnglish
    }

    var body: some View {
        ZStack {
            if bookmarksViewModel.bookmarks.isEmpty {
                Text("There are no Bookmarks")
            } else {
                ScrollView {
                    VStack {
                        ForEach(bookmarksViewModel.bookmarks) { bookmark in
                            NavigationLink(value: "\(bookmark.chapterNumber) \(bookmark.slokNumber)", label: {
                                BookmarksRowView(chapterNumber: bookmark.chapterNumber, slokNumber: bookmark.slokNumber, isEnglish: $isEnglish)
                            })
                            .padding(.vertical, 5)
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .navigationTitle("BookMarks")
        .navigationDestination(for: String.self) { str in
            let components = str.components(separatedBy: " ")
            let chapt = Int(components[0]) ?? 1
            let slokNo = Int(components[1]) ?? 1
            SlokScreen(chapterNumber: chapt, slokNumber: slokNo, isEnglish: $isEnglish)
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Image(systemName: "globe")
                    .onTapGesture {
                        isEnglish.toggle()
                    }
            }
        }
    }
}

struct BookmarksRowView: View {
    let chapterNumber: Int
    let slokNumber: Int
    @Binding var isEnglish: Bool

    var body: some View {
        Text(isEnglish ? "Chapter \(chapterNumber) - Verse \(slokNumber)" : "अध्याय \(chapterNumber) - श्लोक \(slokNumber)")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Capsule().stroke(Color.yellow, lineWidth: 2))
            .padding(.horizontal)
    }
}

#Preview {
    @State var isEnglish = false

    return NavigationStack {
        BookmarksScreen(isEnglish: $isEnglish)
    }
}
