# AssessmentNYT
###### The NYT project is a simple project with improved version.
###### It is designed for specific assessment where user can explore NYT popular.
###### The project consists of a list of articles that, when executed, will show to the screen.

# Getting Started
1. Make sure you have the Xcode version 14.0 or above installed on your computer.
2. Download the Assessment project files from the repository.
3. Open the project files in Xcode.
4. Review the code and make sure you understand what it does.
5. Run the active scheme.
You should see the text "List of articles" on the screen.

You're now ready to start your journey into the world of programming.

# Architecture
- Assessment project is implemented using the CLEAN architecture following with Model-View-ViewModel-Controller (MVVMC) architecture pattern.
- Model has any necessary data needed to generate the datasource.
- View is responsible for displaying the datasource of articles to the user.
- ViewModel has business logic to get input from View/Controller and result with output using COMBINE Framework (Publishers and Subscribers)
- View/Controller handles any user input or interactions and update the View as needed.
- Project doesn't have a database, user interface or any other complex elements based on not in requirements.
- DI Container
- Dependency Injection
- Coordinator pattern for navigation/routing purpose.
- Network library created for handling network requests.
- Modular based app using SPM for dependency handling.
- Repository pattern defined for handling services for every usecase taking care seperate concerns and single responsibility.
- Used Compositional layout collectionview for complex and easy layout design.

# Structure

- "Common": Files or resources that are shared across multiple parts of the project. Such as utility classes, global constants, or reusable UI elements.
- "Modules": The source code files for a specific module. Files within a module folder are organized into subfolders, such as "Views" or "Models" or "ViewModels".
- "NetworkLayer": Module created for handling URLSession and take generic request and pass back the generics type response
- "Resources": Non-code files that are used by the project. These can include images, audio files, video files, and other types of assets.
- "Services": Files or classes related to communicating with an external API. This could include code for making HTTP requests to a web server, parsing responses, and handling any errors that may occur.
- "Configurator": DIContainer handles here for routing between different modules.

  # Running the testcase
    #### "TestCases": Testcase written using mock technique with mock service and response.

- The Assessment project can be tested using the built-in framework XCTest.

  # Dependencies
  SPM is used as a dependency manager. List of dependencies:

- "NetworkLayer" This package created by me using Combine and URLSession for API calling and Reachability handling (https://github.com/hananahmad/NetworkingLayer.git)
- "SDWEBImage" This package provides an async image downloader with cache support. (https://github.com/SDWebImage/SDWebImage.git)
- "NVActivityIndicatorView"  package is a collection of awesome loading animations for loader waiting for api calls to respond. (https://github.com/ninjaprox/NVActivityIndicatorView.git)

# Discussion
For discussion please drop email to me if anything to discuss.


  
  
