# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Reseting Seeds...."

User.destroy_all
Quiz.destroy_all

@user = User.new(
        name: "Derrick",
        email: "derrickpersson@gmail.com",
        password: "testingpassword",
        password_confirmation: "testingpassword"
    )
@user.save!


@quiz = Quiz.create!({
    name: "Transportation v1",
    category: "Transportation"
})

@quiz_question = @quiz.quiz_questions.create!({
    question: "How many times do you cycle in a week?"
})

@answer = Answer.create!({
    quiz_question_id: @quiz_question.id,
    user_id: @user.id,
    answer: "5"
})

# @quiz2 = Quiz.create!({
#     name: "Home v1",
#     category: "Home"
# })

# @quiz_question = @quiz2.quiz_questions.create!({
#     question: "Do you compost at home?"
# })

# @quiz_answer = @quiz_question.answers.create!({
#    answer: "5"
# })