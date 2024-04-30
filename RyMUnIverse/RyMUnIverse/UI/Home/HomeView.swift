//
//  HomeView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties -
    @ObservedObject var viewModel: HomeViewModel
    @State private var searchText = ""
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View -
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                List(content: {
                    ForEach(viewModel.charactersForView) { data in
                        NavigationLink {
                            DetailWireframe(model: data).view
                        } label: {
                            CellRowRepresentable(model: data)
                        }
                    }
                }
                )
                .listStyle(PlainListStyle())
                .padding(.top)
            }
            .padding()
        }
    // MARK: - Lifecycle -
        .onAppear {
            viewModel.getAllCharacters()
        }
        
        .onChange(of: searchText) { newValue in
            viewModel.getCharactersListBySearch(parameter: newValue)
        }
    }
}

#Preview {
    HomeWireframe.createView()
}
