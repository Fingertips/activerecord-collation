# Active Record – Collations

Allows basic management of ICU collations in Postgres.

```ruby
class UpdateNaturalDeCollation < ActiveRecord::Migration[8.1]
  def change
    drop_collation(:natural_de)
	create_collation(
      :natural_de,
      'de-u-kn-true-ks-level1-ka-shifted-kv-symbol'
  	)
  end
end
```

See [Postgres collation documentation](https://www.postgresql.org/docs/current/collation.html) on how to write  ICU locale strings.

## Setup

Add `activerecord-collations` to your dependencies. Include the collation concern into your models to get access to the `collate` class method.

```ruby
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  include ActiveRecord::Collation
end
```

The `collate` method creates an ARel expression for the column with a certain collation.

```ruby
scope :ordered, -> { order(collate(:title, "natural_#{I18n.locale}") }
scope :ordered_de, -> { order(collate(:title, :natural_de)) }
```

Alternatively you can build it yourself:

```ruby
Arel::Nodes::InfixOperation.new(
  'COLLATE',
  arel_table[:title],
  Arel.sql('natural_de')
)
```

## Development

Run tests in this repository with `rake`. Migrations are exercised by running them in the dummy application.

```
cd test/dummy
rm -f db/schema.rb && RAILS_ENV=test bundle exec rake db:drop db:create db:migrate
cd ../../
bundle exec rake
```
