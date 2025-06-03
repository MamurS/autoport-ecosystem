class AppConstants {
  static const String baseUrl = 'https://your-render-app.onrender.com/api/v1';
  static const String googleMapsApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';
  
  // API Endpoints
  static const String authEndpoint = '/auth';
  static const String tripsEndpoint = '/trips';
  static const String carsEndpoint = '/cars';
  static const String bookingsEndpoint = '/bookings';
  static const String usersEndpoint = '/users';
  
  // Shared Preferences Keys
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'user_data';
  
  // Timeouts
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  
  // Pagination
  static const int defaultPageSize = 20;
} 