//
//  DisneyCharactersTests.swift
//  DisneyCharactersTests
//
//  Created by Amit Gupta on 06/01/25.
//

import XCTest
@testable import DisneyCharacters

final class DisneyCharactersViewModelTests: XCTestCase {
    
    var restApiMockWrapper: RestAPIMockWrapper!
    var disneyResponse: DisneyResponse!
    var chracterViewModel: DisneyCharacterViewModel!
    
    override func setUpWithError() throws {
        restApiMockWrapper = RestAPIMockWrapper()
        chracterViewModel = DisneyCharacterViewModel(apiWrapper: restApiMockWrapper)
        /* Mock Disney character collection. */
        let disneyCharacter1 = DisneyCharacter(_id: 10, name: "Kent", imageUrl: "https://static.wikia.nocookie.net/disney/images/d/d3/Vlcsnap-2015-05-06-23h04m15s601.png", createdAt: "2021-04-12T01:31:30.547Z", films: ["Hercules (film)"], tvShows: ["Hercules (TV series)"])
        let disneyCharacter2 = DisneyCharacter(_id: 18, name: "Abigail the Cow", imageUrl: "https://static.wikia.nocookie.net/disney/images/0/05/Fox-disneyscreencaps_com-901.jpg", createdAt: "2021-04-12T01:31:30.547Z", films: ["The Fox and the Hound"], tvShows: ["Hercules (TV series)"])
        let disneyCharacter3 = DisneyCharacter(_id: 2, name: "Prince Axel", imageUrl: "https://static.wikia.nocookie.net/disney/images/8/81/Prince_Axel.png", createdAt: "2021-04-12T01:31:30.547Z", films: ["Hercules (film)"], tvShows: ["Hercules (TV series)"])
        
        disneyResponse = DisneyResponse(data: [disneyCharacter1,disneyCharacter2, disneyCharacter3])
    }
    
    override func tearDownWithError() throws {
        restApiMockWrapper = nil
    }
    
    /* Mock RestAPIWrapper using initialization dependancy injection. */
    func testGetCharactersSuccess(){
        let expectation = self.expectation(description: "FetchCharacters")
        chracterViewModel.fetchCharacters(url: getCharacterAPI)
        if let characterData = chracterViewModel.disneyResponse?.data {
            XCTAssertEqual(characterData[0].name, "Kent")
            XCTAssertNotEqual(characterData[0]._id, 100)
        }else{
            print("View model not initialized.")
        }
        expectation.fulfill()
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetCharactersFailure(){
        let malformedURL = "abc@.com"
        chracterViewModel.fetchCharacters(url: malformedURL)
        XCTAssertNil(chracterViewModel.disneyResponse?.data)
    }
    
    /* Test sort functioanlity. */
    func testSortingDisneyCharacters() {
        let sortedCharactersByAlphabetically = chracterViewModel.sort(by: true, characters: disneyResponse.data!)
        XCTAssertEqual(sortedCharactersByAlphabetically.first?.name, disneyResponse.data![1].name)
        XCTAssertNotEqual(sortedCharactersByAlphabetically.first?.name, disneyResponse.data![0].name)
    }
    
}
