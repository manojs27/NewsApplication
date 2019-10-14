//
//  SearchNewsViewModel.swift
//  NewsApp
//
//  Created by Sudarshan,Manoj on 13/10/19.
//  Copyright © 2019 Sudarshan,Manoj. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class SearchNewsViewModel: ObservableObject {

    @Published var name = "Donald Trump"

    @Published private(set) var cards = [Card]()

    @Published private(set) var cardImages = [Card: UIImage]()

    private var searchCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        searchCancellable?.cancel()
    }

    func search() {
        guard !name.isEmpty else {
            return cards = []
        }

        let urlComponents = URLComponents(string: "https://ma-gateway.dev.iamplus.ai/api/v1/ai/preformatted_query")!
        let json: [String: Any] = [
          "input": [
            "annotations": [
              "topic": "\(name)"
            ],
            "intent": "news_search"
          ],
          "agent_info": [
            "param": "omega"
          ],
          "user": [
            "id": "manoj"
          ]
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        request.httpBody = jsonData

        searchCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map { $0.responses[0].cards }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.cards, on: self)
    }

    func fetchImage(for card: Card) {
        guard case .none = cardImages[card] else {
            return
        }
        guard let url = URL(string: card.image_url) else {
            fatalError("URL is not correct!")
        }

        let request = URLRequest(url: url)
        _ = URLSession.shared.dataTaskPublisher(for: request)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] image in
                self?.cardImages[card] = image
            })
    }
}
