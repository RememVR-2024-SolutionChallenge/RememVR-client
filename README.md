
## 🚀 Launch the app

This project is developed using Flutter. You can launch this app by downloading an apk file or running with IDE(VSCode)!

### 📝 Download APK
1. Enter https://github.com/RememVR-2024-SolutionChallenge/RememVR-client/releases
2. Click the latest release
3. Download app-release.apk
4. Launch this app on Android devices.

### 🏃‍♀️ Run with IDE

#### ⭐ Prerequisites

Before you start, make sure you have installed the following on your system:

- Flutter SDK
- VS Code
- Dart and Flutter extensions for VS Code
- Android emulator or physical device

1. Clone the RememVR repository from GitHub: https://github.com/RememVR-2024-SolutionChallenge/RememVR-client.git
2. Open the project folder in VS Code.
3. In VS Code, open the command palette (View > Command Palette) and type "Flutter: Run Flutter Doctor". This will check your system to make sure everything is set up correctly.
4. In VS Code, open the main.dart file and click the "Run" button. This will launch the app in the emulator or on your physical device.


## 📱 Screens

We separated our application into two tracks, caregiver and care recipient tracks are those. Caregivers can make VR scenes and care recipients can experience VR scenes engaging in reminiscence therapy. 

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/care_main.png?raw=true" style="width: 50%;">

### - Caregiver

#### (1) Creating Avatar
RememVR generates avatars representing the patient's cherished individuals. These avatars, combined with place VR scene, offer the patient an immersive recollection of memories. RememVR assists in safeguarding the continuity of the patient's memories. Caregivers can upload a video featuring the person whom they like to transform into an avatar.

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/caregiver%20-%201.png?raw=true" style="width: 50%;">

#### (2) Creating VR Scene (Place)
RememVR creates VR experiences encapsulating the places intertwined with a patient's memories. We all live with our unique sense of places, as visiting specific locations can evoke memories from particular times. Places in VR will make them feel as if they are physically present in that space. Caregivers can upload videos that showcase distinctive features of the location if its indoor. If with outdoor features they can select the specific location. 

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/caregiver%20-%202.png?raw=true" style="width: 50%;">

#### (3) Creating VR Scene (Avatar + Place)
Caregivers can select one or two avatars, and one place VR scene to build a completed VR scene. After VR scene is generated, care recipient can find out that scene in his/her VR experience list.

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/caregiver%20-%203.png?raw=true" style="width: 50%;">

### - Care recipient

#### (1) VR Experience
Care recipients can participate in VR scene. Our character ‘Brainy’ helps care recipient to follow the steps for VR experience which is a part of the reminiscence therapy. 

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/brainy%20w4.png?raw=true" style="width: 50%;">

#### (2) Badge Tracker
After the care recipient completes the VR experience, badges are awarded as part of gamification. These badges can be viewed not only on the Care Recipient's home-page but also on the Caregiver's home. There are a total of three badge designs, and one of them is randomly assigned.

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/care%20recipient%20-%202.png?raw=true" style="width: 50%;">

## 📋Architecture
<img src="https://github.com/RememberMe-2024-SolutionChallenge/RememVR-client/assets/101000358/5fc52680-0759-47b9-9a0a-b46761ea27cc" width='50%'>

## 👩‍💻Tool & Packages
- Design : [Figma](https://www.figma.com/)
- Http networking : [Dio](https://pub.dev/packages/dio)
- State management : [Provider](https://pub.dev/packages/provider)


