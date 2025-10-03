import SwiftUI

struct SettingsView: View {
    @AppStorage("volume") var volume: Double = 0.5
    @AppStorage("soundType") var soundType: String = "rain"

    var body: some View {
        Form {
            Picker("Sound", selection: $soundType) {
                Text("Rain").tag("rain")
                Text("Ocean").tag("ocean")
                Text("Stream").tag("stream")
                Text("Night").tag("night")
                Text("Dark Noise").tag("darkNoise")
            }
            Slider(value: $volume, in: 0...1) {
                Text("Volume")
            }
        }
        .padding()
        .frame(width: 300)
    }
}
