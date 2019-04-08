# HOME WORK: 5

- use `Ruby >= 2.6.0`
- please create fork from the https://github.com/labs-ruby/homeworks (should be
  already done)
- then create a new branch `my_hw_05` (!)
- and go to the directory to `HW_05`
- create a folder with your name `Name_Surname`


### Tasks:

Your application should describe the interaction between students and mentors.
We'd like to see the following interfaces:

```ruby

student.submit_homework(homework) # Imagine you're posting your homework through GitHub API, the method should make a POST request to a sample host (like example.com) with body containing the following JSON {homework_source:, student:, pr_title:}

mentor.check_homework(homework) # the method sets homework status to succeeded of failed accordingly, condition for checking a homework invent by yourselves

mentor.subscribe_to_student(student)
mentor.notifications # if mentor subscribed to a student, then, when student sends a homework, mentor should see a new notification in the notifications list, something like ["Student #student_name has sent #homework_name"]
mentor.read_notifications! # should set all notifications to "read" status"
```

When you implement the classes structure, create `app.rb` file where you will show the interactions between objects like in the example above.

