CREATE TABLE cars (
    make VARCHAR(100),
    model VARCHAR(100),
    year INT,
    price DECIMAL(10, 2)
);

INSERT INTO cars (make, model, year, price) 
VALUES 
('Toyota', 'Camry', 2020, 25000.00),
('Honda', 'Civic', 2021, 22000.00),
('Ford', 'Mustang', 2019, 35000.00),
('Chevrolet', 'Malibu', 2022, 15000.00);
