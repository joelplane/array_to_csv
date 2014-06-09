# array_to_csv

Simple convenience library for converting an array of hashes to CSV

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'array_to_csv'
```

OR

```ruby
gem 'array_to_csv', :require => 'array_to_csv/core_ext'
```

if you want the to_csv method to be added to the Array class.

Then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install array_to_csv
```

## Example Usage

### Using Array#to_csv (re-opening the Array class)

If you require array_to_csv/core_ext,

```ruby
require 'array_to_csv/core_ext'
```

(or require it from within your Gemfile)
you can call to_csv directly on an array.

```ruby
puts [
  {:first_name => 'Rob', :last_name => 'Bobber'},
  {:first_name => 'Bob', :age => 103}
].to_csv
```

This outputs:

    first_name,last_name,age
    Rob,Bobber,
    Rob,,103

Which would look something like this in your favourite spreadsheet editor

| first_name | last_name | age |
|------------|-----------|-----|
| Rob        | Bobber    |     |
| Bob        |           | 103 |

When no arguments are given to to_csv, the CSV data is returned as a string.

You can pass in a file path, and the CSV data will be written directly to file,
instead of being returned as a string.

```ruby
[
  {:first_name => 'Rob', :last_name => 'Bobber'},
  {:first_name => 'Bob', :age => 103}
].to_csv("/tmp/people.csv")
```

You can also pass in a File object as the first argument, or any other
IO/IO-like object (anything that implements #write(string) and #close).

### Without reopening Array class

If you don't want to being reopening core classes, you can convert an array to CSV
like this:

```ruby
data = [
  {:first_name => 'Rob', :last_name => 'Bobber'},
  {:first_name => 'Bob', :age => 103}
]
puts ArrayToCsv.new(data).to_csv
```

Which produces the same output as above

    first_name,last_name,age
    Rob,Bobber,
    Rob,,103

The interface for ArrayToCsv#to_csv is the same as that for Array#to_csv.

You can pass in a file path, File, or IO/IO-like object.
