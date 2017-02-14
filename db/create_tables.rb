require('sqlite3')

db = SQLite3::Database.new('db/address_bloc.sqlite')

begin
  db.execute('DROP TABLE address_book;')
rescue SQLite3::SQLException
end
begin
  db.execute('DROP TABLE entry;')
rescue SQLite3::SQLException
end

db.execute(<<-SQL)
  CREATE TABLE address_book (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30)
  );
SQL

db.execute(<<-SQL)
  CREATE TABLE entry (
    id INTEGER PRIMARY KEY,
    address_book_id INTEGER,
    name VARCHAR(30),
    phone_number VARCHAR(30),
    email VARCHAR(30),
    FOREIGN KEY (address_book_id) REFERENCES address_book(id)
  );
SQL
