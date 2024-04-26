//
//  HomeViewModel.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    // MARK: - Properties -
    private var dataManager: HomeDataManager
    var cancellables: Set<AnyCancellable> = []
    @Published var charactersForView: Characters = []
    
    init(dataManager: HomeDataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: - Public Method -
    func createCharacters() {
        dataManager.createCharacters()
            .sink { [weak self] completion in
                print(completion)
                if case let .failure(error) = completion {
                    print("Error \(error)")
                }
            } receiveValue: { [weak self] data in
                self?.charactersForView.append(contentsOf: data.results)
            }.store(in: &cancellables)
    }
}
