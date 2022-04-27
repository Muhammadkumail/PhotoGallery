//
//  PhotoGalleryTests.swift
//  PhotoGalleryTests
//
//  Created by Kumail kashefi on 26/04/2022.
//

import XCTest

class PhotoGalleryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetPhotosWithCorrectUrlShouldNotBeNil() {
        let errorExpectation = expectation(description: "error")
        var hits: [Hits]?
        
        DIManager.sharedInstance().photoInteractor.getPhotos { response, error in
            hits = response?.hits
            errorExpectation.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(hits)
        }
    }
    
    func testGetPhotosWithWrongUrlShouldBeNil() {
        
        let errorExpectation = expectation(description: "error")
        var hits: [Hits]?
        DIManager.sharedInstance().photoNetworkService.getPhotoListRequest("wrongUrl", completion: { result in
            
            errorExpectation.fulfill()
            
            switch result{
            case .success(let response):
                hits = response.hits
                
            case .failure(_):
                break
            }
        })
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(hits)
        }
    }
}
