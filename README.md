# Hotel Management System

A comprehensive web-based Hotel Management System built with PHP and MySQL that allows users to manage hotel rooms, tours, and facilities. The system includes both user and admin interfaces for complete hotel management functionality.

## Features

- **User Management**
  - User registration and authentication
  - Secure password handling
  - User profile management

- **Admin Panel**
  - Secure admin login
  - Dashboard for system management
  - User management capabilities

- **Room Management**
  - Room listing with details
  - Room availability tracking
  - Room pricing management
  - Room images and descriptions

- **Tour Management**
  - Tour packages with detailed information
  - Tour booking system
  - Tour itinerary management
  - Tour pricing and capacity control

- **Facilities Management**
  - Hotel facilities listing
  - Facility status tracking
  - Facility images and descriptions

- **Booking System**
  - Tour booking functionality
  - Booking status tracking
  - Payment status management
  - Booking history

## Technical Requirements

- PHP 7.0 or higher
- MySQL 5.7 or higher
- Web server (Apache/Nginx)
- Modern web browser

## Installation

1. Clone the repository to your web server directory:
   ```bash
   git clone [repository-url]
   ```

2. Import the database schema:
   - Use the provided `tourstack_db.sql` file
   - Import it to your MySQL server

3. Configure the database connection:
   - Update database credentials in the configuration file

4. Set up the web server:
   - Point your web server to the project directory
   - Ensure proper permissions are set

5. Access the application:
   - Open your web browser
   - Navigate to the project URL

## Default Admin Credentials

- Username: admin
- Password: admin123

**Note:** Please change the default admin password after first login for security purposes.

## Database Structure

The system uses the following main tables:
- users
- admin_users
- rooms
- facilities
- tours
- tour_bookings

## Security Features

- Password hashing using bcrypt
- Secure session management
- Input validation and sanitization
- SQL injection prevention
- XSS protection

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the repository or contact the development team. 