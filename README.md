# Dart: Handling Unexpected JSON Structures from APIs

This example demonstrates a common error when working with APIs in Dart: unexpected JSON responses.  The code assumes a JSON array, but the API might return an object or an entirely different structure, resulting in runtime errors.

The `bug.dart` file shows the problematic code.  The `bugSolution.dart` offers a solution that gracefully handles these unexpected scenarios.

## Problem:

The initial code directly iterates over the JSON response expecting a list, making it vulnerable to failures if the API returns something different.

## Solution:

The solution enhances error handling by explicitly checking the JSON structure before processing data, and includes more robust error handling.