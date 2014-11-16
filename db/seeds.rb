# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ruby_description =
"Rhuby is a dynamically typed single horned programming language. 
According to its authors, Rhuby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. 
It supports multiple programming paradigms, including functional, object-oriented, and imperative
"

boiler_1 = <<-eos
eos
boiler_2 = <<-eos
def adder(a, b)
  a + b
end

def subtractor(a, b)
  a
end
eos
boiler_3 = <<-eos
class Rhino
  def grunt
    # return a grunt
  end

  def power_level
    # return the power level of any rhino
  end
end
eos

boiler_4 = <<-eos
class Person
  def talk
    "blah blah blah"
  end
end

class Rhino < Object
end
eos

ruby_teaser = "Learn the most awesome language for rhinoceroses."

user  = User.create(email: 'themichaellai@gmail.com', password: 'foobar93', password_confirmation: 'foobar93', name: 'Michael Lai')
rhuby = LessonModule.create(title: 'Ruby', description: ruby_description, teaser: ruby_teaser, language: 'ruby')
first_lesson = {
  title: "Math and Variables",
  description: "Learn how to do math in Ruby",
  lesson_text: "Functions are defined with `def`. Rhuby returns the value from the last line from the function.",
  instructions: "Finish the functions.",
  boilerplate_code: boiler_1,
  lesson_module_id: rhuby.id
}
#lesson_1 = Lesson.create(first_lesson)

second_lesson = {
  title: "Methods",
  description: "Learn about how to do more with less",
  lesson_text: "Functions are defined with `def`. Rhuby returns the value from the last line from the function.",
  instructions: "Finish the functions.",
  boilerplate_code: boiler_2,
  lesson_module_id: rhuby.id
}

lesson_2 = Lesson.create(second_lesson)

third_lesson = {
  title: "Classes",
  description: "Learn about packs of rhinos",
  lesson_text: "Rhinos are pretty uniform, so it would make sense that we use a uniform way to refer to them.",
  instructions: "Finish the class so that the Rhino acts like a rhino.",
  boilerplate_code: boiler_3,
  lesson_module_id: rhuby.id 
}

lesson_3 = Lesson.create(third_lesson)

fourth_lesson = {
  title: "Inheritance",
  description: "Rhinos are people too",
  lesson_text: "Rhinos are people too. Help them understand that we understand.",
  instructions: "Make the rhinos feel welcome by making them part of us.",
  boilerplate_code: boiler_4,
  lesson_module_id: rhuby.id
}

lesson_4 = Lesson.create(fourth_lesson)

test_1_1 = {
  name: "math",
  test_type: "expect",
  arg_a: "adder(2,3)",
  arg_b: "5",
  lesson_id: lesson_2.id,
}
test_1_2 = {
  name: "math2",
  test_type: "expect",
  arg_a: "subtractor(2,3)",
  arg_b: "-1",
  lesson_id: lesson_2.id,
}

Test.create(test_1_1)
Test.create(test_1_2)

test_3_1 = {
  name: "class1",
  test_type: "expect",
  arg_a: "Rhino.new.grunt",
  arg_b: "grunt",
  lesson_id: lesson_3.id,
}
test_3_2 = {
  name: "class2",
  test_type: "expect",
  arg_a: "Rhino.new.power_level",
  arg_b: "9000",
  lesson_id: lesson_3.id,
}
Test.create(test_3_1)
Test.create(test_3_2)

test_4_1 = {
  name: "inher",
  test_type: "expect",
  arg_a: "Rhino.new.talk",
  arg_b: "blah blah blah",
  lesson_id: lesson_4.id,
}
Test.create(test_4_1)
test_4_1 = {
  name: "inher2",
  test_type: "expect",
  arg_a: "Rhino.superclass.name",
  arg_b: "Person",
  lesson_id: lesson_4.id,
}

