
5.times { User.create(username: Faker::Hacker.ingverb, email: Faker::Internet.email, hashed_password: "password") }

10.times { Question.create(user_id: rand(1..5), title: Faker::Space.agency, content: Faker::Lorem.paragraph) }

10.times { Answer.create( question_id: rand(1..10), user_id: rand(1..5), body: Faker::Lorem.paragraph) }

10.times { Comment.create(text: Faker::Lorem.paragraph, user_id: rand(1..5), commentable_id: rand(1..10), commentable_type: ["question", "answer"].sample) }

10.times { Vote.create(voteable_id: rand(1..10), voteable_type: ["question", "answer", "comment"].sample) }
