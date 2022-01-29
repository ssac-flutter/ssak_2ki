const functions = require("firebase-functions");
const admin = require("firebase-admin");
const auth = require("firebase-auth");
const axios = require("axios");

// test
var serviceAccount = require("./fir-test-b1efc-firebase-adminsdk-xmuv5-8c212ce71d.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://fir-test-b1efc.firebaseio.com",
});
// admin.initializeApp();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.kakaologin = functions.https.onRequest((request, response) => {
  const code = request.query.code;
  functions.logger.info(code);
  // functions.logger.info(`Hello logs! : ${code}`, { structuredData: true });
  response.redirect(`webauthcallback://success?code=${code}`);
});

exports.createCustomToken = functions.https.onRequest(
  async (request, response) => {
    const user = request.body;
    // functions.logger.info(user);

    const uid = `kakao:${user.uid}`;
    const updateParams = {
      email: user.email,
      photoURL: user.photoUrl,
      displayName: user.displayName,
    };
    functions.logger.info(updateParams);

    let userRecord;
    try {
      userRecord = await admin.auth().updateUser(uid, updateParams);
    } catch (e) {
      updateParams["uid"] = uid;
      userRecord = await admin.auth().createUser(updateParams);
    }

    const customToken = await admin.auth().createCustomToken(uid);

    response.send(customToken);
  }
);
