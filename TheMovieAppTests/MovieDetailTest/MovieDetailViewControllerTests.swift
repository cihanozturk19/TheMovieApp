//
//  MovieDetailViewControllerTests.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 5.02.2021.
//  Copyright (c) 2021 CİHAN ÖZTÜRK. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TheMovieApp
import XCTest

final class MovieDetailViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: MovieDetailViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupMovieDetailViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMovieDetailViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class MovieDetailBusinessLogicSpy: MovieDetailBusinessLogic {
        
        var getDetailCalled = false
        var favoriteStatusCalled = false
        var changeFavoriteStatusCalled = false
        
        func getDetail() {
            getDetailCalled = true
        }
        
        func favoriteStatus() {
            favoriteStatusCalled = true
        }
        
        func changeFavoriteStatus() {
            changeFavoriteStatusCalled = true
        }        
    }
    
    // MARK: Tests
    
    func testShouldDoSomethingWhenViewIsLoaded()
    {
        // Given
        let spy = MovieDetailBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.getDetailCalled, "viewDidLoad() should ask the interactor to do getDetail")
        XCTAssertTrue(spy.changeFavoriteStatusCalled)

    }
    
    func testViewDidload() {
        // Given
        let spy = MovieDetailBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        sut.tappedFavorite()
        
        // Then
        XCTAssertTrue(spy.favoriteStatusCalled)
    }
}
