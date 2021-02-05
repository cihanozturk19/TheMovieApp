# TheMovieApp

TheMovieApp present to you the most popular movies. Besides, search and see detail of them. 
Data source is [TMDB](https://www.themoviedb.org/). 


### Requirements
- MacOS 10.14.3+
- iOS 13.0+
- Xcode 10.2+
- Swift 5+

### Used Frameworks
-   Foundation
-   UIKit
-   CoreData

### How Developed
- Clean Swift Architecture
- Core Data used for data persistence.
- UI built storyboard and .xib
- Custom Network layer
- Custom Image cache

## Code Explanation
**- Scenes Folder:** It has all scenes of application.
*   **MovieListViewController.swift:** It sends data to MovieListInteractor and display to viewModel, route to go detail scene. Besides, It has two outlet variable which name is searchBar and collectionView. CollectionView has endless scroll with changing "pageId". Also, it handles UISearchBar to filter while user typing.  
*   **MovieListInteractor.swift:** has responsibility fetch movies. It sends response to MovieListPreseneter if everyhting is good.
*   **MovieListPreseneter.swift:**  has responsibility for presentation logic. The response sent by the MovieListInteractor into view models suitable for display. MovieListPreseneter passes those view models back to the MovieListViewController to display.
*   **MovieListRouter.swift:** deals with transitions by passing data between MovieListViewController and MovieDetailViewController.
*   **MovieListModel.swift:** it has enums to model api request and response. Request and response models comforms to Codable protocol

*   **MovieDetailViewController.swift:** It sends data to MovieDetailInteractor and display to viewModel, route to back list scene. Besides, It has a outlet variable which name is tableView.
*   **MovieDetailInteractor.swift:** has responsibility fetch detail movies. It sends response to MovieDetailPreseneter if everyhting is good.
*   **MovieDetailPreseneter.swift:**  has responsibility for presentation logic. The response sent by the MovieDetailInteractor into view models suitable for display. MovieDetailPreseneter passes those view models back to the MovieDetailViewController to display.
*   **MovieDetailRouter.swift:** deals with transitions by passing data between MovieListViewController and MovieDetailViewController.
*   **MovieDetailModel.swift:** it has enums to model api request and response. Request and response models comforms to Codable protocol

**- Data Folder:** It is for Core Data framework.
*   **DataPersistence.swift:** is main file for data persistence. Application uses "fetchFavorites" function to fetch from Favorites entity with NSFetchRequest and returns MovieIds as Int array. Also, it adds, remove movieId with "addFavorite " “removeFavorite" functions.
*   **Favorites.xcdatamodelId:** is has one entity as Favorites and that Favorites entity has "movieID" attribute with Integer64 type to modeling. "movieID" is enough to save which item is favorite. 

**- Components Folder:** It has whole components for app.
*   **CustomImageView.swift:** is custom subclass of UIImageView for image cache with NSCache. It loads image from url with URLSession and cache image with using image url as key value. 
*   **BarButton.swift:** creates UIButton and UIBarButtonItem to put navigationBar
*   **MovieDetailViewCell.swift:** has responsibility just showing UI for view model (MovieDetail.ViewModel) as TableView's cell
*   **BaseView.swift:** inheritance from UIView. It has extension to initialize from .xib
*   **MovieListViewCell.swift:** has responsibility just showing UI for "MovieListView" as CollectionView's cell
*   **MovieListView.swift:** has responsibility just showing UI for "Movie" type item. It inheritance from BaseView

**- Networking Folder:** It has all about networking stuff.
*   **ServiceAPI.swift:** has generic function to handle request and response. 

**- Utilities Folder:** It has custom classes, enums, extensions in that folder.
*   **RequestURL:** has enums for request urls that scenes MovieList and MovieDetail
*   **UICollectionView+Extension:** extended UICollectionView for register and deque function as generic.
*   **ReuseIdentifying:** is protocol to use reuseIdentifier for CollectionView and TableView cells identifier.


 ### Installing
All you have to do is clone. That's it!

## Authors

* **Cihan Öztürk** - [Github](https://github.com/cihanozturk19)

## License
This project is licensed under the MIT License.
