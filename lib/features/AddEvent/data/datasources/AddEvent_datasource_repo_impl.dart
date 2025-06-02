import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:remindus/core/api/api_extentions.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/AddEvent/data/models/add_event_model.dart';
import 'AddEvent_datasource_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddEventDatasourceRepo)
class AddEventDatasourceRepoImpl implements AddEventDatasourceRepo {
final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<Result<void>>createSampleEvent( EventModel eventModel) {
    return executeApi(() async {
      final currentUserId = FirebaseAuth.instance.currentUser?.uid;

      final docRef = _fireStore.collection('events').doc();
      final data = eventModel.toJson();

      data['creatorId'] = currentUserId;
      data['eventId'] = docRef.id;
      data['createdAt'] = FieldValue.serverTimestamp();
      data['updatedAt'] = FieldValue.serverTimestamp();

      await docRef.set(data);
    });
  }

  @override
  Future<Result<Participant?>> getParticipantByNameOrEmail(String query) {
    return executeApi(() async {
      // استعلام بالاسم
      final nameSnapshot = await _fireStore
          .collection('users')
          .where('name', isEqualTo: query)
          .limit(1)
          .get();

      if (nameSnapshot.docs.isNotEmpty) {
        final participant = nameSnapshot.docs.first.data();
        return Participant.fromJson(participant);
      }

      // لو ما لقيتش باسم، ابحث بالإيميل
      final emailSnapshot = await _fireStore
          .collection('users')
          .where('email', isEqualTo: query)
          .limit(1)
          .get();

      if (emailSnapshot.docs.isNotEmpty) {
        final participant = emailSnapshot.docs.first.data();
        return Participant.fromJson(participant);
      }

      // لو ما لقيتش حاجة رجع null أو خطأ
      return null;
    });
  }

}
