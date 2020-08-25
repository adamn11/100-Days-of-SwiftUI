# Project 5 - Word Scramble

## Day 29

### Introducing Lists, your best friend
**Lists** - A container that presents rows of data arranged in a single column (from developer documentation)

The difference between a list and a form is that lists are used for presentation of data rather than requesting user input

```swift
List {
    Text("Hello world!")
}
```

You can also mix static and dynamic rows inside a List view:
```swift
List {
    Text("Row 1")
    Text("Row 2")

    ForEach(0..<5) {
        Text("Dynamic Row \($0)")
    }

    Text("Row 3")
    Text("Row 4")
```

Having both static and a dynamic view inside a list can be useful in recreating something like the Wifi screen in iPhone's settings - a toggle to enable/disable wifi and a dynamic list below to generate a list of nearby networks

Lists can also generate a dynamic list fast by using:

```swift
List (0...5) {
    Text("Hello world!")
}
```
A ForEach would be needed to recreate the code above inside a Form.

The parameter id can be used in a list in order to identify each row uniquely.
```swift
struct ContentView: View {
    let people = ["Finn", "Carol", "Cassie", "Bob"]
    
    List(people, id: \.self) {
        Text($0)
    }
}
```
You can still use ForEach inside lists, but the way above is much faster and cleaner.


### Loading resources from your app bundle
When using an Image view, Xcode knows to look inside your app's assets catalog and it can even automatically adjust the artwork so it fits in the current screen resolution. For text files, JSONs, XMLs, etc, they go inside the pre-generated **bundle** folder. 

URLs are not only used for storing web addresses, it can also store location of files (by using Bundle.main.url()). URLs are optional so make sure to unwrap it like this:
```swift
if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
    // we found the file in our bundle
}

// This code loads the file content into a string
if let fileContents = try? String(contentsOf: fileURL) {
    // Successfully loaded file into a string
}
```

### Working with strings
iOS gives us really powerful APIs for working with Strings, such as the ability to split strings into arrays, remove whitespaces, and even check spelling.

* Split strings into an array, separated by spaces:
```swift
let input = "a b c"
let letters = input.components(separatedBy: " ")
// letters = ["a", "b", "c"]
```

* Can also separate by line breaks:
```swift
let input = """
            a
            b
            c
            """
let letters = input.components(separatedBy: "\n")
// letters = ["a", "b", "c"]
```
* Return a random letter in a string
```swift
let letter = letters.randomElement()
```
* **trimmingCharaters(in:)** can remove certain kinds of characters from the start and end of a string
```swift
let letter = "a b c d e f"
let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
// trimmed = "abcdef"
```
* Check for misspelled words
```swift
let word = "swift"
// creates an instance of UITextChecker (used from UIKit)
let checker = UITextChecker()
// tell the checker how much of the string we want to check
let range = NSRange(location: 0, length: word.utf16.count)
// ask the checker to report where it found any misspellings in the word
let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

let allGood = misspelledRange.location == NSNotFound
```
