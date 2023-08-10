//
//  ContentView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

struct AllChaptersView: View {
    var allChaptersViewModel = AllChaptersViewModel()
    @State var isEnglish: Bool = false
    @State var navigationPath: NavigationPath = .init()
    @Environment(\.colorScheme) var colorScheme // Access color scheme

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                if allChaptersViewModel.allChapters.isEmpty {
                    ProgressView()
                } else {
                    VStack {
                        Button(isEnglish ? "Show Random Slok" : "कोई भी श्लोक देखें") {
                            let randomChapterNumber = Int.random(in: 1 ... 18)
                            let chapterInfo = allChaptersViewModel.getChapterInfo(chapterNumber: randomChapterNumber)
                            let randomSlokNumber = Int.random(in: 1 ... chapterInfo.verses_count)

                            navigationPath.append(chapterInfo)
                            navigationPath.append("\(randomChapterNumber) \(randomSlokNumber)")
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)

                        ScrollView {
                            ForEach(allChaptersViewModel.allChapters, id: \.chapter_number) { chapter in

                                NavigationLink(value: chapter, label: {
                                    SingleChapterCardView(chapter: chapter, isEnglish: $isEnglish)
                                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                })
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: ChapterModel.self) { chapter in
                ChapterInformationView(chapter: chapter, isEnglish: $isEnglish)
            }
            .navigationTitle(isEnglish ? "Bhagavad Gita" : "भगवद गीता")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "globe")
                        .onTapGesture {
                            isEnglish.toggle()
                        }
                }
            }
        }
    }
}

struct SingleChapterCardView: View {
    let chapter: ChapterModel
    @Binding var isEnglish: Bool

    var body: some View {
        VStack {
            Text("\(chapter.chapter_number) - " + (isEnglish ? chapter.translation : chapter.name))
                .font(.title)
                .fontWeight(.bold)

            Spacer()
            Spacer()
            Spacer()

            Text(isEnglish ? "Verses: \(chapter.verses_count)" : "श्लोक: \(chapter.verses_count)")

            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()

            Text(isEnglish ? chapter.summary.en : chapter.summary.hi)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 2))
    }
}

#Preview {
    AllChaptersView()
}

#Preview("SingleChapterCardView") {
    @State var isEnglish = false

    return SingleChapterCardView(chapter: ChapterModel.testChapter, isEnglish: $isEnglish)
}
