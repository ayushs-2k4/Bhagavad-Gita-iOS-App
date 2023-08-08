//
//  ContentView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import Combine
import SwiftUI

@Observable
class AllChaptersViewModel {
    var allChapters: [ChapterModel] = []
    var cancellables: [AnyCancellable] = []

    init() {
        getAllChapters()
    }

    func getAllChapters() {
        guard let url = URL(string: "https://bhagavadgitaapi.in/chapters") else {
            print("Error in making allChapters url")
            return
        }

        print("url: \(url)")

        downloadData(url: url)
            .decode(type: [ChapterModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Success")

                case .failure(let error):
                    print("error: \(error)")
                }

            }, receiveValue: { [weak self] receivedAllChapters in
                self?.allChapters = receivedAllChapters
            })
            .store(in: &cancellables)
    }
}
