---
title: iOS SwiftUI App Development Guidelines
---

## Project Context
This is a SwiftUI iOS app using MVVM architecture with Core Data.

## Code Standards
- Use SwiftUI for all UI components
- Follow MVVM pattern strictly
- Write comprehensive unit tests for all ViewModels
- Use Swift 6 concurrency (async/await)
- Follow Apple's Human Interface Guidelines

## File Structure
- Views: SwiftUI views and components
- ViewModels: @ObservableObject classes with @Published properties
- Models: Data models and Core Data entities
- Services: Network and business logic
- Tests: Unit and UI tests

## Always Remember
- Test on iOS 17+ minimum deployment target
- Use proper error handling with Result types
- Implement accessibility features
- Follow Swift naming conventions
