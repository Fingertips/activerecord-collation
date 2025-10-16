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

Add `activerecord-collations` to your dependencies. If you also want the `collate` class method on your model you also include the collation module:

```ruby
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include ActiveRecord::Collation
end
```

The collate method creates an ARel expression for the column with a certain collation.

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

## Testing

The Dummy application uses the gem so you can load the schema and run migrations there:

```
cd test/dummy
RAILS_ENV=test rake db:migrate
```
