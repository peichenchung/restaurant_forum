namespace :dev do #讓指令出現前綴,有助於指令的結構化管理,如同rails db:migrate
  task fake: :environment do #定義執行指令為rails dev:fake,:environment讓Rake與Model和資料庫互動
    Restaurant.destroy_all #先清除舊資料

    500.times do |i|
      Restaurant.create!(name: FFaker::Company.name,
      opening_hours: FFaker::Time.day_of_week,
      tel: FFaker::PhoneNumber.short_phone_number,
      address: FFaker::Address.street_address,
      description: FFaker::Lorem.paragraph)
    end

    #提示任務執行完畢
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
end