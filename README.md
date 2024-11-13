# ServerConfiguration

A simple server configuration manager for managing different base URLs (Development, Staging, and Production) based on the target environment in an iOS application. This project utilizes conditional compilation to dynamically switch between server environments during runtime.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Accessing the Base URL](#accessing-the-base-url)
  - [Example API Call](#example-api-call)
- [Contributing](#contributing)
- [License](#license)

## Overview

The **Server Configuration Manager** is designed to handle different base URLs based on the environment in which the app is running (Development, Staging, or Production). By using conditional compilation flags, the application selects the appropriate base URL depending on the target configuration.

This approach makes it easy to switch between different server environments without needing to change code or hardcode URLs.

## Features

- **Environment-specific URLs**: Supports multiple environments, including Development, Staging, and Production.
- **Conditional Compilation**: Dynamically switches base URLs using Swift's compiler flags.
- **Simple API Integration**: Easy to integrate with API calls by simply using the `baseURL` in the `AppAPIManager`.

## Installation

To use the **Server Configuration Manager** in your iOS project, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/ikavyaaaa/ServerConfiguration.git
   
2. **Add the code to your project**:

   - **Copy the ServerConfiguration.swift file into your iOS project.
   - **Ensure that you have set up the correct build configurations (Development, Staging, and Production).

