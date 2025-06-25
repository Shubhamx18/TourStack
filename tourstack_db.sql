-- Create database if not exists
CREATE DATABASE IF NOT EXISTS tourstack;
USE tourstack;

-- Table for user accounts
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for admin users
CREATE TABLE IF NOT EXISTS admin_users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  last_login TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default admin user (username: admin, password: admin123)
INSERT INTO admin_users (username, password) VALUES
('admin', '$2y$10$uE6pS4OivGYMWN0WBk69wOS8r9FpAK2t0kTj2jCIQAXR0k6FEyUDC');

-- Table for rooms
CREATE TABLE IF NOT EXISTS rooms (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  capacity INT NOT NULL,
  image_path VARCHAR(255) NOT NULL,
  status ENUM('active', 'inactive') DEFAULT 'active'
);

-- Table for facilities
CREATE TABLE IF NOT EXISTS facilities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  icon VARCHAR(50) NOT NULL,
  image_path VARCHAR(255) DEFAULT NULL,
  status ENUM('active', 'inactive') DEFAULT 'active'
);

-- Table for tours
CREATE TABLE IF NOT EXISTS tours (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  duration VARCHAR(50) NOT NULL,
  max_people INT NOT NULL DEFAULT 10,
  image_path VARCHAR(255) NOT NULL,
  tag VARCHAR(50) DEFAULT NULL,
  includes JSON DEFAULT NULL,
  itinerary JSON DEFAULT NULL,
  status ENUM('active', 'inactive') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for tour bookings
CREATE TABLE IF NOT EXISTS tour_bookings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  tour_id INT NOT NULL,
  booking_date DATE NOT NULL,
  people INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  payment_status ENUM('pending', 'paid', 'cancelled') DEFAULT 'pending',
  booking_status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (tour_id) REFERENCES tours(id)
);

-- Sample data for tours
INSERT INTO tours (name, description, price, duration, max_people, image_path, tag, includes, itinerary, status) VALUES 
('City Heritage Tour', 'Explore the rich cultural heritage of our city with this guided tour. Visit historical monuments, museums, and sample local cuisine along the way.', 
1500.00, '5 Hours', 15, 'images/city-tour.jpg', 'Popular', 
'[{"icon":"fas fa-bus", "text":"Air-conditioned transport"}, {"icon":"fas fa-utensils", "text":"Lunch at a local restaurant"}, {"icon":"fas fa-ticket-alt", "text":"Entry fees to attractions"}, {"icon":"fas fa-user-tie", "text":"Professional tour guide"}, {"icon":"fas fa-camera", "text":"Photo opportunities"}]',
'[{"time":"9:00 AM", "activity":"Pickup from hotel"}, {"time":"9:30 AM", "activity":"Visit to National Museum"}, {"time":"11:30 AM", "activity":"Historical Palace tour"}, {"time":"1:00 PM", "activity":"Lunch break"}, {"time":"2:30 PM", "activity":"City marketplace visit"}, {"time":"4:00 PM", "activity":"Return to hotel"}]',
'active'
),
('Adventure Mountain Trek', 'For the adventure seekers, this trekking experience offers breathtaking views and an adrenaline rush. Suitable for moderately fit participants.', 
2500.00, '1 Day', 12, 'images/adventure-tour.jpg', 'Featured', 
'[{"icon":"fas fa-hiking", "text":"Experienced trek guides"}, {"icon":"fas fa-shoe-prints", "text":"Trekking equipment"}, {"icon":"fas fa-hamburger", "text":"Packed lunch and snacks"}, {"icon":"fas fa-first-aid", "text":"First aid kit"}, {"icon":"fas fa-shuttle-van", "text":"Transportation to and from base"}]',
'[{"time":"7:00 AM", "activity":"Departure from hotel"}, {"time":"8:30 AM", "activity":"Reach base camp"}, {"time":"9:00 AM", "activity":"Trek briefing and equipment check"}, {"time":"9:30 AM", "activity":"Begin trek"}, {"time":"12:30 PM", "activity":"Lunch at scenic viewpoint"}, {"time":"4:30 PM", "activity":"Return to base camp"}, {"time":"6:00 PM", "activity":"Return to hotel"}]',
'active'
),
('Nature and Wildlife Tour', 'Discover the natural beauty and wildlife in the surrounding nature reserves. Perfect for nature lovers and those seeking a peaceful retreat from city life.', 
2800.00, '8 Hours', 10, 'images/nature-tour.jpg', 'New', 
'[{"icon":"fas fa-car", "text":"4x4 vehicle transport"}, {"icon":"fas fa-binoculars", "text":"Binoculars for wildlife viewing"}, {"icon":"fas fa-utensils", "text":"Packed lunch and refreshments"}, {"icon":"fas fa-hiking", "text":"Nature trail hiking"}, {"icon":"fas fa-user-tie", "text":"Expert naturalist guide"}]',
'[{"time":"7:30 AM", "activity":"Pickup from hotel"}, {"time":"8:30 AM", "activity":"Arrival at wildlife sanctuary"}, {"time":"8:45 AM", "activity":"Wildlife spotting safari"}, {"time":"11:30 AM", "activity":"Nature walk with guide"}, {"time":"1:00 PM", "activity":"Lunch at observation deck"}, {"time":"2:30 PM", "activity":"Bird watching session"}, {"time":"4:00 PM", "activity":"Visit to conservation center"}, {"time":"5:30 PM", "activity":"Return to hotel"}]',
'active'
);

-- Sample data for rooms
INSERT INTO rooms (name, description, price, capacity, image_path, status) VALUES
('Luxury Room', 'Experience ultimate comfort in our luxurious rooms.', 600.00, 2, 'images/luxury-room.jpg', 'active'),
('Simple Room', 'Comfortable and affordable accommodation.', 300.00, 2, 'images/simple-room.jpg', 'active'),
('Supreme Deluxe Room', 'The pinnacle of luxury and comfort.', 900.00, 3, 'images/supreme-deluxe.jpg', 'active');

-- Sample data for facilities
INSERT INTO facilities (name, description, icon, image_path, status) VALUES
('Swimming Pool', 'Relax in our luxurious infinity pool with a view of the city skyline.', 'fas fa-swimming-pool', 'images/swimming-pool.jpg', 'active'),
('Fitness Center', 'Stay fit during your vacation with our state-of-the-art fitness equipment.', 'fas fa-dumbbell', 'images/fitness-center.jpg', 'active'),
('Spa & Wellness', 'Indulge in a variety of rejuvenating treatments at our premium spa.', 'fas fa-spa', 'images/spa.jpg', 'active'); 