import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remindus/core/api/api_extentions.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/core/utils/extension.dart';
import 'package:remindus/features/Auth/domain/entities/user_entity.dart';
import 'Auth_datasource_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthDatasourceRepo)
class AuthDatasourceRepoImpl implements AuthDatasourceRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  Future<Result<UserSignInEntity?>> signIn(String email, String password) {
    return executeApi(() async {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userEntity = credential.toUserEntity();
      final userDoc = FirebaseFirestore.instance.collection('users').doc(credential.user?.uid);
      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        await userDoc.set({
          "id": credential.user?.uid,
          'email': userEntity.email,
          'name': userEntity.name,
          'image': userEntity.image,
          'createdAt': FieldValue.serverTimestamp(),
          // أي بيانات إضافية
        });
      } else {
        // لو موجود ممكن تحدث بيانات معينة لو حبيت
        await userDoc.update({
          'lastLogin': FieldValue.serverTimestamp(),
          'image': userEntity.image,
        });
      }

      return userEntity;
    });
  }

  @override
  Future<Result<UserSignInEntity?>> signUp(String userName, String email, String password) {
    return executeApi(() async {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userEntity = credential.toUserEntity();
      final userDoc = FirebaseFirestore.instance.collection('users').doc(credential.user?.uid);
      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {

        await userDoc.set({
          "id": credential.user?.uid,
          'email': email,
          'name': userName,
          'image': userEntity.image,
          'createdAt': FieldValue.serverTimestamp(),
          // أي بيانات إضافية
        });
      } else {

        await userDoc.update({
          'lastLogin': FieldValue.serverTimestamp(),
        });
      }

      return userEntity;
    });
  }
  @override
  Future<Result<UserSignInEntity?>> signInWithGoogle() {
    return executeApi(() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential oauthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(oauthCredential);
      final userEntity = userCredential.toUserEntity();

      final userDoc = FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid);
      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        // لو المستخدم جديد، أضف بياناته
        await userDoc.set({
          "id": userCredential.user?.uid,
          'email': userEntity.email,
          'name': userEntity.name,
          'image': userEntity.image,
          'createdAt': FieldValue.serverTimestamp(),
          // أي بيانات إضافية
        });
      } else {
        // لو موجود ممكن تحدث بيانات معينة لو حبيت
        await userDoc.update({
          'lastLogin': FieldValue.serverTimestamp(),
          'image': userEntity.image,
        });
      }

      return userEntity;
    });

  }

  @override
  Future<Result<UserSignInEntity?>> signInWithGithub() {
    return executeApi(() async {
      final githubProvider = GithubAuthProvider();

      // تسجيل الدخول باستخدام GitHub
      final userCredential = await _firebaseAuth.signInWithProvider(githubProvider);
      final userEntity = userCredential.toUserEntity();

      final userDoc = FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid);
      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        // لو المستخدم جديد، أضف بياناته
        await userDoc.set({
          "id": userCredential.user?.uid,
          'email': userEntity.email,
          'name': userEntity.name,
          'image': userEntity.image,
          'createdAt': FieldValue.serverTimestamp(),
          // أي بيانات إضافية
        });
      } else {
        // لو موجود ممكن تحدث بيانات معينة لو حبيت
        await userDoc.update({
          'lastLogin': FieldValue.serverTimestamp(),
          'image': userEntity.image,
        });
      }

      return userEntity;
    });

  }
}


