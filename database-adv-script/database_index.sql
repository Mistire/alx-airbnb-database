DROP INDEX IF EXISTS idx_user_email;

EXPLAIN ANALYZE
SELECT * FROM "User"
WHERE email = 'alice@example.com';

CREATE INDEX idx_user_email ON "User"(email);

EXPLAIN ANALYZE
SELECT * FROM "User"
WHERE email = 'alice@example.com';




