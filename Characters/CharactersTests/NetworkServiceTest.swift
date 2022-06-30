//
//  NetworkServiceTest.swift
//  CharactersTests
//
//  Created by Christo Kumar on 30/06/22.
//

import XCTest
@testable import Characters

class TestResponse: Decodable {
    let dataStr: String
}

class NetworkServiceTest: XCTestCase {

    func test_ApiTest_With_ValidRequest_Returns_ValidResponse() {
        let urlString = "https://rickandmortyapi.com/api/character/?"
        let networkService = NetworkService()
        
        let exepectation = self.expectation(description: "Valid Request")
        Task {
            let result: Result<WebCharactersResponse, NetworkError> = await networkService.fetchDataFromApi(withUrl: urlString)
            switch result {
            case .success( let webCharacterResponse):
                XCTAssertNotNil(webCharacterResponse)
                XCTAssertNotNil(webCharacterResponse.results)
                break
            case .failure(let error):
                XCTAssertNil(error)
                break
            }
            exepectation.fulfill()
        }
        waitForExpectations(timeout: 100, handler: nil)
    }
    
    func test_ApiTest_With_InvalidDecodable_Returns_DecodingError() {
        let urlString = "https://rickandmortyapi.com/api/character/?"
        let networkService = NetworkService()
        let exepectation = self.expectation(description: "Invalid Response")
        Task.init() {
            let result: Result<TestResponse, NetworkError> = await networkService.fetchDataFromApi(withUrl: urlString)
            switch result {
            case .success( let animalResponse):
                XCTAssertNil(animalResponse)
                break
            case .failure(let error):
                XCTAssert(error.self == NetworkError.decodingError)
                break
            }
            exepectation.fulfill()
        }
        waitForExpectations(timeout: 100, handler: nil)
    }
    
    func test_ApiTest_With_InvalidUrl_Returns_BadUrl() {
        let urlString = ""
        let networkService = NetworkService()
        let exepectation = self.expectation(description: "Invalid Response")
        Task.init() {
            let result: Result<TestResponse, NetworkError> = await networkService.fetchDataFromApi(withUrl: urlString)
            switch result {
            case .success( let animalResponse):
                XCTAssertNil(animalResponse)
                break
            case .failure(let error):
                XCTAssert(error.self == NetworkError.badUrl)
                break
            }
            exepectation.fulfill()
        }
        waitForExpectations(timeout: 100, handler: nil)
    }

}
