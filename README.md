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

### Without reopening Array class

```ruby
data = [
  {:first_name => 'Rob', :last_name => 'Bobber'},
  {:first_name => 'Bob', :age => 103}
]
puts ArrayToCsv.new(data).to_csv
```

Outputs

    first_name,last_name,age
    Rob,Bobber,
    Rob,,103

Which would look something like this in your favourite spreadsheet editor

| first_name | last_name | age |
|------------|-----------|-----|
| Rob        | Bobber    |     |
| Bob        |           | 103 |

### Using Array#to_csv (re-opeing the Array class)

If you require array_to_csv/core_ext,

```ruby
require 'array_to_csv/core_ext'
```

(or require it from within your Gemfile)
you can call to_csv on the array itself.

```ruby
puts [
  {:first_name => 'Rob', :last_name => 'Bobber'},
  {:first_name => 'Bob', :age => 103}
].to_csv
end
```

Which produces the same output

    first_name,last_name,age
    Rob,Bobber,
    Rob,,103
