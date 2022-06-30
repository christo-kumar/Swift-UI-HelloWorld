//
//  ViewModalTest.swift
//  CharactersTests
//
//  Created by Christo Kumar on 30/06/22.
//

import XCTest
@testable import Characters

class StubbedClass {
    var invokedTimes = 0
    
    func resetInovocation() {
        invokedTimes = 0
    }
}

class MockNetworkService : StubbedClass, NetworkServiceProtocol {

    var expectedResult: Any?
    
    func fetchDataFromApi<T>(withUrl: String) async -> Result<T, NetworkError> where T : Decodable {
        self.invokedTimes += 1
        return self.expectedResult as?  Result<T, NetworkError> ?? .failure(.badRequest)
    }
}

class ViewModalTest: XCTestCase {
    
    var viewModal: CharacterViewModel!
    var mockNetworkService: MockNetworkService!
    
    @MainActor override func setUp() {
        mockNetworkService = MockNetworkService()
        viewModal = .init(networkService: mockNetworkService)
    }
    
    func test_networkService_forInvocation() {
        mockNetworkService.resetInovocation()
        Task {
            await viewModal.fetchData()
            XCTAssert(mockNetworkService.invokedTimes == 1)
        }
    }
    
    func test_networkService_forSuccess() {
        let webCharacter = WebCharacter(id: 1, name: "Rick")
        let mockResponse = WebCharactersResponse(info: nil, results: [webCharacter])
        let result: Result<WebCharactersResponse,NetworkError> = .success(mockResponse)
        mockNetworkService.expectedResult = result
        Task {
            await viewModal.fetchData()
            let characters = await viewModal.characters
            XCTAssertNil(characters)
            XCTAssert(characters.count > 0)
            XCTAssert(characters[0].name == "Rick")
        }
        
        
    }
    
}
