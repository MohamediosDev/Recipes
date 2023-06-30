
# Recipes
A simple project To Get Some Recipes 

# Description
<p>Very Simple Project To Get Recipes Data</p>

# Getting started
<p>
1. Make sure you have the Xcode version 14.0 or above installed on your computer.<br>
2. Download the Recipes project files from the repository.<br>
3. Open the project files in Xcode.<br>
4. Run the active scheme.<br>

# Usage
To Login Into Recipes App Just Type.
* Email: " Soda@Brightskies.com "
* Password: "12345678"


# Architecture
* Recipes project is implemented using the <strong>Model-View-ViewModel (MVVM)</strong> architecture pattern.
* Model has any necessary data.
* View is responsible for displaying the List Of Data to the user.
* View Model Is carry All business Logic.
  

# Structure 
* "Core": It's Core App Like App Delegate And Scene Delegate.
* "Managers": Carry App Managers Like Database Managers & User Managers.
* "Scenes": Screen App By Features.
* "Helpers": it's Helpers Code To quick Development time.
* "Network layer": responsible to manage app network requests
* "Support Files": it's Some Files Like Assets File And Launch Screen Files

# Running the tests
<p>To Running Tests For Recipes App Just press "Command + U" </p>

# Dependencies
[SPM](https://www.swift.org/package-manager/) is used as a dependency manager.
List of dependencies: 
* SPM 'Cosmos' -> To Show Some UI For Rate View.
* SPM 'Kingfisher' -> For Load Images Of Recipes From Remote.
* SPM 'Realm' -> For handle Database For App
* SPM 'Toast' -> To Show Toast Alert. 


# API 
* We are using a REST API
* List of Recipes calls is [here](https://api.npoint.io/43427003d33f1f6b51cc) 
