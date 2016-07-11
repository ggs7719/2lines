namespace :dev do

  task :fake => :environment do

    user = User.first

      10.times do |i|
        Order.create( :title => "心情", :content => ["喜", "怒", "哀", "樂"].sample, :mother_id => user)
        Order.create( :title => "生理", :content => ["頭暈", "痠痛"].sample, :mother_id => user)

        Quest.create( :title => Faker::Lorem.sentence, :content => Faker::Lorem.sentences, :mother_id => user)

        Prenatal.create( :title =>Faker::Lorem.sentence, :content => Faker::Lorem.sentences, :mother_id => user)

      end


  end

end