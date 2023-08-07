//
//  SlokViewModel.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import Combine
import SwiftUI

class SlokViewModel: ObservableObject {
    @Published var slok: SlokModel? = nil
    var cancellables: [AnyCancellable] = []

//    init() {}

    init(chapterNumber: Int, slokNumber: Int) {
        getChapterInformation(chapterNumber: chapterNumber, slokNumber: slokNumber)
    }

    func getChapterInformation(chapterNumber: Int, slokNumber: Int) {
        print("Downloading slok: \(chapterNumber) - \(slokNumber)")
        guard let url = URL(string: "https://bhagavadgitaapi.in/slok/\(chapterNumber)/\(slokNumber)") else {
            print("Error in making Slok url")
            return
        }

        print("url: \(url)")

        downloadData(url: url)
            .decode(type: SlokModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Success")

                case .failure(let error):
                    print("error: \(error)")
                }

            }, receiveValue: { [weak self] receivedSlok in
                self?.slok = receivedSlok
            })
            .store(in: &cancellables)
    }
}
