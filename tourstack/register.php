<?php
// Start session
session_start();

// Check if user is already logged in
if (isset($_SESSION['user_id'])) {
    // Redirect to home page
    header("Location: index.php");
    exit;
}

// Include database connection
require_once 'db_connection.php';

// Check if there's an error message in session
$register_error = isset($_SESSION['register_error']) ? $_SESSION['register_error'] : '';
unset($_SESSION['register_error']);

// Include header
include 'includes/header.php';
?>

<main class="main-content py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4 p-md-5">
                        <div class="text-center mb-4">
                            <i class="fas fa-user-plus fa-3x text-primary mb-3"></i>
                            <h2 class="fw-bold">Create an Account</h2>
                            <p class="text-muted">Join TourStack to book your dream tours and rooms</p>
                        </div>
                        
                        <?php if (!empty($register_error)): ?>
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>
                                <?php echo htmlspecialchars($register_error); ?>
                            </div>
                        <?php endif; ?>
                        
                        <p class="alert alert-info mb-4">
                            <i class="fas fa-info-circle me-2"></i>
                            Your details must match with your ID (Aadhaar card, passport, driving license, etc.) that will be required during check-in.
                        </p>
                        
                        <form action="register_process.php" method="POST">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="reg-name" class="form-label">Full Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light"><i class="fas fa-user text-muted"></i></span>
                                        <input type="text" class="form-control" id="reg-name" name="name" placeholder="Enter your full name" required>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="register-email" class="form-label">Email</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light"><i class="fas fa-envelope text-muted"></i></span>
                                        <input type="email" class="form-control" id="register-email" name="email" placeholder="Enter your email" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light"><i class="fas fa-phone text-muted"></i></span>
                                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="dob" class="form-label">Date of Birth</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light"><i class="fas fa-calendar text-muted"></i></span>
                                        <input type="date" class="form-control" id="dob" name="dob" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="reg-password" class="form-label">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light"><i class="fas fa-lock text-muted"></i></span>
                                        <input type="password" class="form-control" id="reg-password" name="password" placeholder="Create a password" required>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="confirm-password" class="form-label">Confirm Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light"><i class="fas fa-lock text-muted"></i></span>
                                        <input type="password" class="form-control" id="confirm-password" name="confirm_password" placeholder="Confirm your password" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="d-grid mt-4">
                                <button type="submit" class="btn btn-primary btn-lg">REGISTER</button>
                            </div>
                        </form>
                        
                        <div class="text-center mt-4 pt-3 border-top">
                            <p class="mb-0">Already have an account? <a href="login.php" class="text-decoration-none fw-medium">Login Here</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<?php include 'includes/footer.php'; ?>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        <?php if (!empty($register_error)): ?>
            Swal.fire({
                title: 'Error',
                text: '<?php echo addslashes($register_error); ?>',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        <?php endif; ?>
        
        // Client-side validation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            const password = document.getElementById('reg-password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                Swal.fire({
                    title: 'Error',
                    text: 'Passwords do not match',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    });
</script> 