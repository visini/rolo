abort "Refusing to seed RAILS_ENV=live — this environment holds real data." if Rails.env.live?

Oaken.seed :users
Oaken.seed :people
Oaken.seed :groups
Oaken.seed :group_memberships
Oaken.seed :notes
