# swiftui.samples


#Особенности
Интерполяция с использованием объекта struct Clock: VectorArithmetic:

```
struct ClockShape: Shape {
    
    var animatableData: Clock {
        get {
            clock
        }
        set {
            clock = newValue
        }
    }
    ...
}
```

у Picker есть метод onChange:

```
Picker(...)
        .onChange(of: selectedHours, perform: { value in
                    // любой код
         })
```