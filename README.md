# swiftui.samples


1. Есть View heirarchy, нужно при изменении в ChildView запускать перерисовку в ParentView. <br>
2. При перерисовке нужно предварительно вызывать функцию reconfigSettings() <br>

`
struct ContentView: View {
    var body: some View {
        ..
    }

    func reconfigSettings() {
        ...
    }
}
`