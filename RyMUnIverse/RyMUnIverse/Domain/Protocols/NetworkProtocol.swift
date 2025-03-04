//
//  NetworkProtocol.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 26/4/24.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func getModelByAPI<T: Decodable>(relativePath: String,
                                     type: T.Type) -> AnyPublisher<T, BaseError>
    
    func getModelWithParametersByAPI<T: Decodable>(relativePath: String,
                                                   parameter: String,
                                                   type: T.Type) -> AnyPublisher<T, BaseError>
    
    func getEpisodeByUrl(relativePath: String) -> AnyPublisher<Episode, BaseError>
}
