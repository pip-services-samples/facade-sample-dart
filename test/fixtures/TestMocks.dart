import 'package:mockito/mockito.dart';
import 'package:pip_clients_accounts/pip_clients_accounts.dart';
import 'package:pip_clients_activities/pip_clients_activities.dart';
import 'package:pip_clients_emailsettings/pip_clients_emailsettings.dart';
import 'package:pip_clients_passwords/pip_clients_passwords.dart';
import 'package:pip_clients_roles/pip_clients_roles.dart';
import 'package:pip_clients_sessions/pip_clients_sessions.dart';
import 'package:pip_clients_smssettings/pip_clients_smssettings.dart';

class MockActivitiesClientV1 extends Mock implements IActivitiesClientV1 {}

class MockAccountsClientV1 extends Mock implements IAccountsClientV1 {}

class MockPasswordsClientV1 extends Mock implements IPasswordsClientV1 {}

class MockSessionsClientV1 extends Mock implements ISessionsClientV1 {}

class MockRolesClientV1 extends Mock implements IRolesClientV1 {}

class MockEmailSettingsClientV1 extends Mock implements IEmailSettingsClientV1 {
}

class MockSmsSettingsClientV1 extends Mock implements ISmsSettingsClientV1 {}
