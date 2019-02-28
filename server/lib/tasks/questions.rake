desc "Create Questions with options"
task create_questions: :environment do
  questions = ['What is your favorite colour', 'What is your favorite sports', 'Who is your favorite pet', 'Who is your ideal person', 'Where you want to go for tour']
  options = { 'What is your favorite colour'  => ['Red', 'Yellow', 'Green'], 
  						'What is your favorite sports'  => ['Cricket', 'Footboll', 'Chess'],
  						'Who is your favorite pet'      => ['Dog', 'Cat', 'Mouse' ],
  						'Who is your ideal person'      => ['Actor', 'Politician', 'Businessman'],
  						'Where you want to go for tour' => ['India', 'USA', 'China']
  }
  questions.each do |q|
    que = Question.create(title: q, options: options[q])
  end
  puts "Questions created successfully."
end
