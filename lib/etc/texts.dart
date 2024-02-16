List<String> questions = [
  "How are you feeling \nright now?",
  "Could you briefly \nshare your \nimpressions after \nwatching the VR \nvideo?",
  "Where did you \nvirtually visit \nthrough VR?",
  "What memories are \nassociated with the\n place you visited\n through VR?",
  "What were the\n names of the people\n you met through\n VR?",
  "How would you\n describe your \nrelationship with the\n people who\n appeared in the VR?",
  "Please share the \nmost memorable\n event related to this\n spatial experience."
];
List<String> responses = [
  "Thank you for \nsharing your \nemotions and \nfeelings.",
  "Now, I'll ask you a \nfew more questions \nrelated to today's VR \nexperience. Please\n answer them\n comfortably.",
  "Awesome! \nYou're doing well.",
  "Please continue \nanswering the \nquestions! If it's still \nchallenging or if you \ncan't recall, feel free \nto press the 'Pass' \nbutton at any time."
];

List<String> reinforcementTexts = [
  'Thank you for sharing your memories.',
  'The current process is designed to make you feel more comfortable in your daily life.',
  'I will help you remember old memories and stories about the people you love and care for, ensuring that you don\'t forget them.',
  "I'm really glad that I'm your caring assistant. Hope to see you soon!"
];
String avatarImageGuide =
    "✅ The front face should be easily recognizable in the picture\n\t\t\t\t- Best picture to look straight at the camera without turning your neck or eyes\n\t\t\t\t- Difficult to implement if the picture is too dark or too bright\n✅ Hair on the forehead and side of the face is preferably absent (otherwise hair will appear on the texture of the face)\n✅ Neutral expression, not to open the mouth (the lip texture may not be correct if you see a tooth in the input photo)\n✅ Neat to remove glasses (glasses are only reconstructed in textures rather than 3D mesh)";
String avatarVideoGuide =
    "✅ Characters must have a full body\n✅ It must be a well-distinguished image (*The background does not need to be monochromatic) \n✅ an image of a person rotating 360 degrees from a fixed camera";
String placeGuide =
    "✅ The more detailed the video, the better. (Recommended within 1 to 5 minutes in length)\n✅ Space shooting should not be too fast (too fast, resulting in lower rendering quality as there is no guarantee of sufficient overlap between images when extracting image frames)\n✅ It is recommended that the image does not include any possible moving objects. (Moving objects are likely to be blurred and rendered)";
