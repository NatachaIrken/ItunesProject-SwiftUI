# iTunesProject

## Description
iTunesProject is a SwiftUI-based iOS application designed to showcase a list of artists with their songs. It enables users to browse through a curated collection of songs, explore artist information, and manage favorites effortlessly.

## Features
1. **iTunes Screen:**
   - Displays a list of songs fetched from the iTunes API.
   - Users can tap on a song to view detailed information about the respective artist.
   - Provides the functionality to mark songs as favorites by tapping on a star icon.

2. **Favorites View:**
   - Presents a convenient list of favorite songs marked by the user.
   - Enables users to easily access and manage their favorite songs.

3. **Country List View:**
   - this Features stay pending -> 

4. **Artist Info View:**
   - Provides in-depth information about the selected artist.
   - Showcases the artist's name, country, and artwork of their albums.

5. **Reusable Components:**
   - Implements SwiftUI's components such as List, VStack, HStack, etc., ensuring a clean and intuitive user interface.
   - Utilizes SwiftUI's ObservedObject to effectively manage view model data and state.

## Architecture and Technologies Used
- **Clean Architecture with MVVM:** The application follows the principles of Clean Architecture, separating concerns into layers: Presentation, Domain, and Data. It employs the Model-View-ViewModel (MVVM) design pattern to ensure separation of concerns and facilitate testability.
- **SwiftUI:** The user interface is built using SwiftUI, Apple's modern declarative framework for building user interfaces across all Apple platforms. SwiftUI enables rapid development and simplifies the process of creating dynamic and interactive user interfaces.
- **iTunes API:** The application utilizes the iTunes Search API to fetch a list of popular songs. This API endpoint is queried to retrieve a curated list of 10 songs to display in the application.
