# swiftui.samples

Основное внимание стоит обратить не на GeometryEffect,
а на поведение animatableData.

1. ContentView передает значения параметров в LabelView, а тот пробрасывает их в SkewedOffset.
2. В этот момент создается объект SkewedOffset, SwiftUI включает постоянный вызов (loop intermediate) animatableData, передавая ему промежуточные значения параметров
3. SwiftUI запоминает у себя таргетные значения параметров
4. При повторном нажатии Animate, срабатывают пункты 1,2,3   при этом начальные значения animatableData будут проинициализированы с предыдущих таргентных значений


Нажатие: (offset: 50, moveFraction: 1)

moveFaction: 0 -> 1
offset: 0 -> 50


Нажатие: (offset: -120, moveFraction: 0)

moveFaction: 1 -> 0
offset: 50 -> -120


