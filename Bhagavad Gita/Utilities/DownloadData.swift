//
//  ChapterModel.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import Combine
import Foundation

func downloadData(url: URL) -> AnyPublisher<Data, Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
        .subscribe(on: DispatchQueue.global(qos: .background))
        .receive(on: DispatchQueue.main)
        .tryMap(handleOutput)
        .eraseToAnyPublisher()
}

func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
    guard let response = output.response as? HTTPURLResponse,
          response.statusCode >= 200 && response.statusCode < 300 else { throw URLError(.badServerResponse) }

    return output.data
}

func downloadDataWithAsyncAwait(url: URL) async throws -> Data {
    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          (200 ..< 300).contains(httpResponse.statusCode)
    else {
        throw URLError(.badServerResponse)
    }

    return data
}
