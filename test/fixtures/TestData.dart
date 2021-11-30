import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_activities/pip_services_activities.dart';

class TestUsers {
  static String AdminUserId = '1';
  static String AdminUserName = 'Admin User';
  static String AdminUserLogin = 'admin';
  static String AdminUserPassword = 'pwd123';
  static String AdminUserSessionId = '111';

  static String User1Id = '2';
  static String User1Name = 'User #1';
  static String User1Login = 'user1';
  static String User1Password = 'pwd123';
  static String User1SessionId = '222';

  static String User2Id = '3';
  static String User2Name = 'User #2';
  static String User2Login = 'user2';
  static String User2Password = 'pwd123';
  static String User2SessionId = '333';
}

class TestData {
  static PartyActivityV1 generateActivity() {
    return PartyActivityV1(
        id: RandomString.nextString(9, 9),
        org_id: RandomString.nextString(9, 9),
        type: RandomText.word(),
        time: RandomDateTime.nextDate(DateTime(2000, 0, 1)),
        party: ReferenceV1(
            id: RandomString.nextString(9, 9),
            type: RandomText.word(),
            name: RandomText.fullName()),
        ref_item: ReferenceV1(
            id: RandomString.nextString(9, 9),
            type: RandomText.word(),
            name: RandomText.fullName()),
        ref_party: ReferenceV1(
            id: RandomString.nextString(9, 9),
            type: RandomText.word(),
            name: RandomText.fullName()),
        ref_parents: [
          ReferenceV1(
              id: RandomString.nextString(9, 9),
              type: RandomText.word(),
              name: RandomText.fullName())
        ]);
  }

  static DataPage<PartyActivityV1> generateActivityDataPage([int? max]) {
    var min = 2;
    max = max ?? 8;
    var count = RandomInteger.nextInteger(min, max);
    var activities = <PartyActivityV1>[];
    for (var i = 0; i < count; i++) {
      activities.add(generateActivity());
    }
    return DataPage<PartyActivityV1>(activities, count);
  }
}
