import 'package:step_by_step/mvc/views/admins/admin_home_page.dart';
import 'package:step_by_step/mvc/views/admins/library_admin.dart';
import 'package:step_by_step/mvc/views/auth/login_page.dart';
import 'package:step_by_step/mvc/views/auth/registration_screen.dart';
import 'package:step_by_step/mvc/views/user/appointment_booking.dart';
import 'package:step_by_step/mvc/views/user/book_reservation.dart';
import 'package:step_by_step/mvc/views/user/home_page.dart';

class RoutesConstants {
  static const LOGIN_ROUTE_PATH = "login";
  static const REGISTRATION_ROUTE_PATH = "registration";
  static const ADMIN_HOME_PAGE_ROUTE_PATH = "admin_home";
  static const HOME_PAGE_ROUTE_PATH = "home_page";
  static const APPOINTMENT_BOOKING_ROUTE_PATH = "appointment_booking";
  static const BOOK_RESERVATION_ROUTE_PATH = "book_reservation";
  static const LIBRARY_ADMIN_ROUTE_PATH =   "library_admin_page";

  static getRoutesMap() {
    return {
      LOGIN_ROUTE_PATH: (context) => LoginScreen(),
      REGISTRATION_ROUTE_PATH: (context) => RegistrationScreen(),
      ADMIN_HOME_PAGE_ROUTE_PATH: (context) => AdminHomePage(),
      HOME_PAGE_ROUTE_PATH: (context) => HomePage(),
      APPOINTMENT_BOOKING_ROUTE_PATH: (context) => AppointmentBooking(),
      BOOK_RESERVATION_ROUTE_PATH: (context) => BookReservation(),
      LIBRARY_ADMIN_ROUTE_PATH: (context) => LibraryAdmin(),
    };
  }
}
