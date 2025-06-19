<?php
// Database connection settings (edit as needed)
$host = 'localhost'; // Database host
$user = 'root';     // Database username
$pass = '';         // Database password
$db   = 'coptic_patriarchs'; // Database name

// Connect to MySQL database
$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die('Database connection failed: ' . $conn->connect_error);
}

// Fetch all patriarchs, ordered by period (oldest to newest)
$sql = 'SELECT * FROM patriarchs ORDER BY CAST(SUBSTRING_INDEX(period, "-", 1) AS UNSIGNED) ASC';
$result = $conn->query($sql);

?>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <title>بطاركة الكنيسة القبطية</title>
    <!-- Link to external CSS file -->
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Theme toggle icon button -->
    <button class="theme-toggle" id="themeToggle" title="تبديل الوضع الليلي/النهاري" aria-label="تبديل الوضع الليلي/النهاري">
        <span id="themeIcon">🌙</span>
    </button>
    <h1 class="site-title">بطاركة الكنيسة القبطية الأرثوذكسية</h1>
    <!-- Navigation buttons -->
    <div style="text-align:center; margin-bottom: 24px;">
        <a href="search.php" style="display:inline-block; margin:0 10px; background:#2980b9; color:#fff; padding:10px 22px; border-radius:6px; text-decoration:none; font-size:1em;">بحث متقدم</a>
        <a href="heresies.php" style="display:inline-block; margin:0 10px; background:#b03a2e; color:#fff; padding:10px 22px; border-radius:6px; text-decoration:none; font-size:1em;">البدع والهرطقات</a>
    </div>
    <div class="patriarchs-grid">
        <?php
        // Loop through patriarchs and display each one
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                // Use a placeholder image if none is set
                $img = $row['image'] ? htmlspecialchars($row['image']) : 'https://via.placeholder.com/90x90?text=No+Image';
                echo '<div class="patriarch-card">';
                echo '<a href="patriarch.php?id=' . $row['id'] . '">'; // Link to details page
                echo '<img src="' . $img . '" alt="' . htmlspecialchars($row['name']) . '">';
                echo '</a>';
                echo '<div class="patriarch-name">' . htmlspecialchars($row['name']) . '</div>';
                echo '<div class="patriarch-period">' . htmlspecialchars($row['period']) . '</div>';
                echo '</div>';
            }
        } else {
            echo '<p>لا يوجد بطاركة في قاعدة البيانات.</p>';
        }
        ?>
    </div>
    <script>
    // Theme toggle logic with icon
    const themeToggle = document.getElementById('themeToggle');
    const themeIcon = document.getElementById('themeIcon');
    function setTheme(theme) {
        document.body.setAttribute('data-theme', theme);
        localStorage.setItem('theme', theme);
        themeIcon.textContent = theme === 'dark' ? '☀️' : '🌙';
    }
    // On load, set theme from localStorage or default to light
    (function() {
        const saved = localStorage.getItem('theme');
        if (saved === 'dark') setTheme('dark');
        else setTheme('light');
    })();
    themeToggle.onclick = function() {
        const current = document.body.getAttribute('data-theme');
        setTheme(current === 'dark' ? 'light' : 'dark');
    };
    </script>
</body>
</html>
<?php
// Close the database connection
$conn->close();
// End of file
// -------------------
// To edit: change database settings, or edit HTML/CSS as needed
// To add images: upload them and set the correct filename in the database
// To add more patriarchs: insert into the database
// ------------------- 