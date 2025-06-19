-- Create database (edit the name if needed)
CREATE DATABASE IF NOT EXISTS coptic_patriarchs;
USE coptic_patriarchs;

-- Table: Patriarchs
CREATE TABLE patriarchs (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each patriarch
    name VARCHAR(255) NOT NULL,        -- Patriarch's name (in Arabic)
    period VARCHAR(255) NOT NULL,      -- Period of patriarchy (in Arabic)
    image VARCHAR(255),                -- Image path or filename
    bio TEXT,                         -- Biography (in Arabic)
    synaxarium TEXT                   -- Synaxarium biography
);

-- Table: Heresies
CREATE TABLE heresies (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each heresy
    name VARCHAR(255) NOT NULL,        -- Heresy name (in Arabic)
    description TEXT,                  -- Description (in Arabic)
    response TEXT                      -- How to respond (in Arabic)
);

-- Table: Patriarchs-Heresies Relationship
CREATE TABLE patriarchs_heresies (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each relation
    patriarch_id INT NOT NULL,         -- Patriarch ID (foreign key)
    heresy_id INT NOT NULL,            -- Heresy ID (foreign key)
    FOREIGN KEY (patriarch_id) REFERENCES patriarchs(id),
    FOREIGN KEY (heresy_id) REFERENCES heresies(id)
);

-- Insert 20 sample patriarchs (names, periods, bios in Arabic)
INSERT INTO patriarchs (name, period, image, bio) VALUES
('البابا مرقس الرسول', '43-68 م', 'markos.jpg', 'أول بابا للإسكندرية ومؤسس الكنيسة القبطية.'),
('البابا أنيانوس', '68-83 م', 'aniyanos.jpg', 'ثاني بابا للكنيسة القبطية وخدم في وقت صعب.'),
('البابا ميليوس', '83-95 م', 'milius.jpg', 'ثالث بابا للكنيسة القبطية.'),
('البابا كردونوس', '95-106 م', 'kardonos.jpg', 'رابع بابا للكنيسة القبطية.'),
('البابا برموديوس', '106-118 م', 'barmoudios.jpg', 'خامس بابا للكنيسة القبطية.'),
('البابا يسطس', '118-129 م', 'yostos.jpg', 'سادس بابا للكنيسة القبطية.'),
('البابا أومانيوس', '129-141 م', 'omanius.jpg', 'سابع بابا للكنيسة القبطية.'),
('البابا مرقيانوس', '141-152 م', 'markianos.jpg', 'ثامن بابا للكنيسة القبطية.'),
('البابا كلاديانوس', '152-166 م', 'kladianos.jpg', 'تاسع بابا للكنيسة القبطية.'),
('البابا هيراكلاس', '232-248 م', 'heraklas.jpg', 'ثالث عشر بابا للكنيسة القبطية.'),
('البابا ديونيسيوس', '248-264 م', 'dionysios.jpg', 'رابع عشر بابا للكنيسة القبطية.'),
('البابا بطرس الأول', '300-311 م', 'botros1.jpg', 'بابا الشهداء وأول من لقب ببابا الإسكندرية.'),
('البابا أثناسيوس الرسولي', '328-373 م', 'athanasius.jpg', 'حامي الإيمان الأرثوذكسي ضد الأريوسية.'),
('البابا كيرلس الأول', '412-444 م', 'cyril1.jpg', 'عمود الدين ومدافع عن العقيدة الأرثوذكسية.'),
('البابا ديسقوروس', '444-454 م', 'dioscorus.jpg', 'مدافع عن الطبيعة الواحدة للمسيح.'),
('البابا بنيامين الأول', '622-661 م', 'benjamin1.jpg', 'بابا في عصر الفتح العربي لمصر.'),
('البابا شنودة الثالث', '1971-2012 م', 'shenouda3.jpg', 'بابا الإصلاح والتجديد في العصر الحديث.'),
('البابا كيرلس السادس', '1959-1971 م', 'cyril6.jpg', 'بابا المعجزات والصلاة.'),
('البابا تواضروس الثاني', '2012-حتى الآن', 'tawadros2.jpg', 'البابا الحالي للكنيسة القبطية.'),
('البابا بطرس الجولي', '300-311 م', 'botros_gawly.jpg', 'بابا شهيد في عصر الاضطهاد.');

-- Insert sample heresies (names, descriptions, responses in Arabic)
INSERT INTO heresies (name, description, response) VALUES
('الأريوسية', 'بدعة أنكرت ألوهية المسيح.', 'الرد كان من خلال مجمع نيقية وكتابات البابا أثناسيوس.'),
('النسطورية', 'بدعة فصلت بين طبيعة المسيح الإلهية والبشرية.', 'الرد كان من خلال مجمع أفسس وكتابات البابا كيرلس الأول.'),
('الطبيعتين', 'بدعة قالت بوجود طبيعتين منفصلتين في المسيح.', 'الرد كان من خلال مجمع خلقيدونية ورفض الكنيسة القبطية له.');

-- Insert sample relationships (edit as needed)
INSERT INTO patriarchs_heresies (patriarch_id, heresy_id) VALUES
(13, 1), -- البابا أثناسيوس الرسولي واجه الأريوسية
(14, 2), -- البابا كيرلس الأول واجه النسطورية
(15, 3); -- البابا ديسقوروس واجه بدعة الطبيعتين 

-- Add Synaxarium column for a short biography from the Synaxarium
ALTER TABLE patriarchs ADD COLUMN synaxarium TEXT AFTER bio; 