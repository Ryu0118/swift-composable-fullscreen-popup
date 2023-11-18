# ComposableFullscreenPopup
A library optimized for Composable Architecture, enabling easy presentation of customizable popups above the NavigationBar.

## Motivation
ComposableFullscreenPopup is an extension of the [FullscreenPopup](https://github.com/Ryu0118/swift-fullscreen-popup) library, specifically designed for SwiftUI and optimized for use with Composable Architecture. This library addresses the challenges of displaying custom alerts in SwiftUI, particularly in scenarios involving modal views. Standard methods like using ZStack or overlay modifiers are limited, as they are constrained within the bounds of active modal views, preventing full-screen extensions crucial for capturing the user's full attention.

Our solution leverages the fullscreenCover modifier, allowing custom alerts to be presented over the entire screen, irrespective of any active modal views. This ensures that custom alerts are not limited by modal boundaries, enabling them to completely cover the background content and prevent unintended interactions. 

|  ZStack or overlay  |  This Library  |
| ---- | ---- |
|  <img src="https://github.com/Ryu0118/swift-fullscreen-popup/assets/87907656/9756e921-ba9f-4190-8cb8-0b3b7e1f16a8" width="200">  |  <img src="https://github.com/Ryu0118/swift-fullscreen-popup/assets/87907656/1c1b9478-81e5-491c-86d1-e52e2c8b7fbd" width="200">  |
