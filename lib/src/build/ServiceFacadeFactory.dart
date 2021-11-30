import 'package:pip_services_beacons_dart/pip_services_beacons_dart.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services_accounts/pip_services_accounts.dart';
import 'package:pip_services_passwords/pip_services_passwords.dart';
import 'package:pip_services_roles/pip_services_roles.dart';
import 'package:pip_services_sessions/pip_services_sessions.dart';

class ServiceFacadeFactory extends CompositeFactory {
  ServiceFacadeFactory() : super(null) {
    add(SessionsServiceFactory());
    add(AccountsServiceFactory());
    add(PasswordsServiceFactory());
    add(RolesServiceFactory());
    add(BeaconsServiceFactory());
  }
}
