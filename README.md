
## 🚀 Launch the app

This project is developed using **Flutter.** You can launch this app by downloading an apk file or running with IDE(VSCode)!

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
- Flutter Configuration : execute 'flutter doctor' and check configuration.

```bash
$ git clone https://github.com/RememVR-2024-SolutionChallenge/RememVR-client.git
$ flutter run
```
## 📱 Screens

We separated our application into two tracks :  **Care-giver** and **Care-recipient** 
Care-givers can **make VR scenes** and care-recipients can **experience VR scenes** engaging in reminiscence therapy. 

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/care_main.png?raw=true" style="width: 80%;">

### 👨‍⚕️Care-giver

#### (1) Creating VR Avatar
RememVR **generates avatars** representing the patient's cherished individuals. These avatars, combined with place VR scene, offer the patient an immersive recollection of memories. RememVR assists in safeguarding the continuity of the patient's memories. Caregivers can upload a video featuring the person whom they like to transform into an avatar.

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/caregiver%20-%201.png?raw=true" style="width: 80%;">

#### (2) Creating VR Scene
RememVR creates VR experiences encapsulating the **places intertwined with a patient's memories**. We all live with our unique sense of places, as visiting specific locations can evoke memories from particular times. Places in VR will make them feel as if they are physically present in that space. Care-givers can **upload videos that showcase distinctive features of the location.** 

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/caregiver%20-%202.png?raw=true" style="width: 80%;">

#### (3) Creating VR Scene (Avatar + Place)
Caregivers can select **one or several VR avatars, and one place VR scene** to build a completed VR video. After VR video is generated, care-recipient can find out that videos in his/her VR experience list.

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/caregiver%20-%203.png?raw=true" style="width: 80%;">

### 🤝Care-recipient

#### (1) VR Experience
Care-recipients can **participate in VR video.** Our character ‘Brainy’ helps care recipient to follow the steps for VR experience which is a part of the **reminiscence therapy.**

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/brainy%20w4.png?raw=true" style="width: 80%;">

#### (2) Badge Tracker
After the care-recipient completes the VR experience, badges are awarded as part of **gamification.** These badges can be viewed not only on the care-recipient's home-page but also on the care-giver's home. There are a total of three badge designs, and one of them is randomly assigned.

<img src="https://github.com/RememVR-2024-SolutionChallenge/.github/blob/main/profile/assets/care%20recipient%20-%202.png?raw=true" style="width: 80%;">


## 🌌 VR Management
### 🎥 How do we make VR videos?
- Care-giver uploads images of the desired person's face, full body photos, and background.
- The person and background are **reborn as VR avatar and scene** models through our AI server.
- Among the created VR models, care-giver selects a model that he wants to make into a **VR video**, **modifies the location information** on the VR-viewer web page, and transmits it to the server.
After the image generation process, the care-recipient can **select and view the video** that the VR device wants to see.

### 🗄️ How do we store and manage VR models?
- We don't have a separate server that stores VR models itself, but we store VR models that care-giver requested to create **locally in the app**.
- Since the avatar model includes face and body information corresponding to **personal information**, if another care-giver logs in, it **deletes all stored VR models**.
- VR models are stored in the *{directoryPath}/sample/{vr-model-id}/model.fbx* path and **location information is modified on the vr-viewer page** with the models selected by the care-giver.
- The storage path of the selected VR models is **accessed and edited on the vr-viewer page**.
- Metadata of all generated VR images is stored in *{directoryPath}/sample/vr-video-id/meta-data.json*. The image selected by the care-recipient is viewed on the vr-viewer page.
- The corresponding web page may **access the metadata storage path** of the selected image and the user can view the image on the vr-viewer page.

## 📋Architecture
<img src="https://github.com/RememberMe-2024-SolutionChallenge/RememVR-client/assets/101000358/5fc52680-0759-47b9-9a0a-b46761ea27cc" width='70%'>

## 👩‍💻Tool & Packages
- Design : [Figma](https://www.figma.com/)
- Http networking : [Dio](https://pub.dev/packages/dio)
- State management : [Provider](https://pub.dev/packages/provider)


