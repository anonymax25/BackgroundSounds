import SwiftUI
import AppKit

struct BackgroundSoundsApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            SettingsView()
        }
    }
}

// MARK: - AppDelegate for Menu Bar
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create status bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "waveform.path.ecg", accessibilityDescription: "Background Sounds")
        }

        // Build menu
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Toggle Background Sounds", action: #selector(toggleSounds), keyEquivalent: "t"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Settings…", action: #selector(openSettings), keyEquivalent: ","))
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "q"))
        statusItem.menu = menu
    }

    @objc func toggleSounds() {
      print("url")
      if let url = URL(string: "x-apple.systempreferences:com.apple.Accessibility?Seeing_Display") {
        print(url)
          NSWorkspace.shared.open(url)
      }
        Task {
            // await AccessibilityController.shared.toggleBackgroundSounds()
        }
    }

    @MainActor @objc func openSettings() {
        NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
    }

    @MainActor @objc func quit() {
        NSApp.terminate(nil)
    }
}
