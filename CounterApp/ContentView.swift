import SwiftUI

struct ContentView: View {
    @State private var waterCount = 0
    // daily goal
    let dailyGoal = 8
    
    var body: some View {
        ZStack {
            // bg Color
            Color(.systemTeal).opacity(0.1)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // header
                Text("Hydration Tracker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                // PROGRESS RING
                ZStack {
                    // Gray background circle
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundColor(.blue)
                    
                    // filled fg circle
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(Double(waterCount) / Double(dailyGoal), 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.blue)
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear, value: waterCount) // smooth animation
                    
                    // text inside the circle
                    VStack {
                        Text("\(waterCount) / \(dailyGoal)")
                            .font(.system(size: 50, weight: .bold))
                        Text("Glasses")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: 250, height: 250)
                .padding()
                
                // CONTROLS
                HStack(spacing: 30) {
                    // Remove Button
                    Button(action: {
                        if waterCount > 0 { waterCount -= 1 }
                    }) {
                        Image(systemName: "minus")
                            .font(.title)
                            .frame(width: 70, height: 70)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    
                    // Add Button
                    Button(action: {
                        waterCount += 1
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .frame(width: 70, height: 70)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
