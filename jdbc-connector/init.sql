-- Input table (source) - Leads
CREATE TABLE IF NOT EXISTS leads (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample leads
INSERT INTO leads (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Emily', 'Smith', 'emily.smith@example.com'),
('Michael', 'Johnson', 'michael.johnson@example.com'),
('Sophia', 'Brown', 'sophia.brown@example.com'),
('David', 'Wilson', 'david.wilson@example.com');

-- Output table (sink) - Customers
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP
);
