```markdown
# Crypto Price Tracker (VIPER Architecture)

Crypto Price Tracker is an iOS application designed to display the real-time values of cryptocurrencies. This project demonstrates the use of **VIPER Architecture** and **protocol-oriented programming** to ensure clean, scalable, and testable code.

## Features

- **VIPER Architecture**: Separates concerns into five distinct layers:
  - **View**: Displays the UI and interacts with the Presenter.
  - **Interactor**: Handles business logic and data fetching.
  - **Presenter**: Manages communication between View and Interactor.
  - **Entity**: Defines data structures used in the app.
  - **Router**: Handles navigation between screens.
- **Protocol-Oriented Programming**: Implements a protocol-driven design for better flexibility and testability.
- **JSON Integration**: Fetches cryptocurrency data via an API and displays it in a TableView.
- **Programmatic UI**: The user interface is built programmatically without using Storyboard or SwiftUI.
- **Dynamic Updates**: Presents cryptocurrency data dynamically in a user-friendly format.

## Technologies Used

- **Swift**: For developing the application.
- **VIPER Architecture**: Ensures modularity and clear separation of concerns.
- **URLSession**: To fetch JSON data from the API.
- **Programmatic UI Design**: Builds the interface directly in code for better flexibility and customization.

## How It Works

### VIPER Structure

1. **View**:  
   - Displays a TableView and cells for listing cryptocurrency values.
   - Receives updates from the Presenter and interacts with the user.
   
2. **Interactor**:  
   - Fetches cryptocurrency data from the API.
   - Processes and passes the data to the Presenter.

3. **Presenter**:  
   - Acts as a mediator between the View and Interactor.
   - Sends user interactions to the Interactor and updates the View with processed data.

4. **Entity**:  
   - Defines the structure of cryptocurrency data fetched from the JSON API.

5. **Router**:  
   - Handles navigation logic for the app.
   - Manages screen transitions.

### Programmatic UI

- The entire UI, including the **TableView** and **cells**, is created programmatically.  
- No Storyboard or SwiftUI was used to design the interface.

### Data Flow

1. **Interactor** fetches data from the JSON API via a link using `URLSession`.  
2. Data is passed to the **Presenter**, which processes it and sends it to the **View**.  
3. The **View** displays the data in a TableView for the user to see.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/alperenkaraca23/Viper-Crypto-Crazy.git
   cd viper-crypro-crazy
   ```

2. Open the project in Xcode:
   ```bash
   open ViperCryptoCrazy.xcodeproj
   ```

3. Build and run the app on a simulator or physical device.

## Video Demo

https://github.com/user-attachments/assets/3231de5a-4a14-4a81-9b88-6d8d500cbfe4

## Folder Structure

```
CryptoPriceTracker/
├── View/
│   ├── View.swift        # UI and TableView logic
├── Interactor/
│   ├── Interactor.swift  # Business logic and API integration
├── Presenter/
│   ├── Presenter.swift   # Manages interaction between View and Interactor
├── Entity/
│   ├── Entity.swift      # Data models for cryptocurrency
├── Router/
│   ├── Router.swift      # Navigation and routing logic
```
