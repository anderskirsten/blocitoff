namespace :todo do
  desc "Auto Delete Tasks Created More than 7 Days Ago"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
