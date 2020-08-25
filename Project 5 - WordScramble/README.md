# Project 5 - Word Scramble

## Day 29

  
**Lists** - A container that presents rows of data arranged in a single column (from developer documentation)

The difference between a list and a form is that lists are used for presentation of data rather than requesting user input

```
List {
    Text("Hello world!")
}
```

You can also mix static and dynamic rows inside a List view:
```
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

```
List (0...5) {
    Text("Hello world!")
}
```
A ForEach would be needed to recreate the code above inside a Form.

The parameter id can be used in a list in order to identify each row uniquely.
```
struct ContentView: View {
    let people = ["Finn", "Carol", "Cassie", "Bob"]
    
    List(people, id: \.self) {
        Text($0)
    }
}
```
You can still use ForEach inside lists, but the way above is much faster and cleaner.
