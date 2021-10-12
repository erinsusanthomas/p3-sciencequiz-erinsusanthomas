67-272: ScienceQuiz App
===
Please use the Github classroom link for submission : https://classroom.github.com/assignment-invitations/141f2845d4b50b600b87045ee7742aae

This code is for the ScienceQuiz project assigned to Information Systems students at Carnegie Mellon University in 67-272 during the Spring 2021 semester.  More information about this project can be found on Canvas (Assignments > Phase 3).

Additional documentation for the requirements of this project and technical documents to guide student work can be found in the `docs` directory of this project.  Please be sure to read carefully all the project notes below.  In addition, if there are any notes the students wants to communicate to the teaching staff, please use the student notes section at the very bottom for this purpose.


Project Notes: Phase 3
---
This phase we will continue our project to develop a foundation for the ScienceQuiz system. In this phase, we will focus our efforts on building out the interface for the initial set of models built in Phase 2. This phase will constitute 7 percent of your final course grade and is broken down into the following components:

1. **Implementation of Site Design**: A basic design for the site using CSS and appropriate images should be created. Unless students have strong CSS skills and already have a series of stylesheets they like to work with, students should use a CSS framework like [MaterializeCSS](http://materializecss.com/) or [Foundation](https://foundation.zurb.com/) or [Bootstrap](https://getbootstrap.com/) to build their application. (We strongly encourage the use of MaterializeCSS, but not a requirement.)  At the same time, it is important to customize the framework for your own purposes; expect a grade penalty if you pretty much stick with all the defaults the framework provides.  A home page for the application needs to be set up with some appropriate content, but design decisions about the exact contents are not being graded in this phase. The student's name must appear on the bottom of every page in the footer (name should be listed as webmaster or designer). The information layout for employee, store and assignment views as well as add/edit forms for these models should be appropriate.  See handout for additional issues raised by our limited set of models in this phase

2. **CRUD Functionality Established**: In this phase, you will continue to use the phase 2 data model, which is a simplified system.  A web-based interface for doing all CRUD operations for the entities must be up and working. The cucumber tests provided must all pass to get full credit.  You will see from the cucumber tests that our emphasis is mostly on the CRU part of CRUD, although there are controller tests for the D as well.  To a large extent, this section will be assessed using tests discussed below and carries the bulk of the grade in this phase.

3. **Unit and Functional Testing**: All models along with all unit and functional tests (given as a solution to the previous phase) must be fully working. Since you were given a solution, expect a heavy penalty if this solution is not implemented and any unit tests fail.  You are free to add new methods to the models, but be sure they are fully tested so your coverage does not fall below 100 percent.

4. **Coding Style**: All code must be appropriately organized. What that means at this stage is the following: Indentation should be used consistently to make code readable. Comments showing organization should be present and explaining difficult code should be used when/if necessary. All business logic should be in models, not views or controllers.

<hr>

**A few notes on grading this phase:**

1.	There is a strong emphasis on passing both the controller tests and the cucumber tests in this phase.  We are giving you the tests to pass and the contexts to run them, so there are no excuses for failing tests.  If any test fails, there is no credit for any of the work covered by that file.  That said, not all files are of equal value, so we will tell you what is worth what below. 

  - The simplest set of controller tests to pass are those in `home_controller_test`.  Passing these simple tests is worth 3 points.
  - For `organizations_controller_test`, `teams_controller_test`, and `students_controller_test` passing these tests are worth 10 points each.  Any tests fails in one of those sets and you lose the points for that set.
  - The StudentTeams controller tests are split into two parts:
  
	- *Part1*: `student_teams_controller_test` handles a basic new/create from the `teams#show` action as well as removing records and ensuring that you didn't use `resources :student_teams` for your routes.  This part is worth 8 points.  
		
	- *Part2*:  `student_teams_part2_controller_test` that simply deals with the the `new` action where the request comes from the `students#show` page; this is tied in with the final cucumber test.  Part 2 of this controller test is worth 2 points.
		
  - Total score for passing all controller tests is 43 points
  - For cucumber tests, `0_Setup_basic` is worth 2 points.
  - Read-focused cucumber tests like `1_Organization_read_tests`, `2_Team_read_tests` and `3_Student_read_tests` are each worth 7 points.
  - Write-focused cucumber tests like `4_Organization_write_tests`, `5_Team_write_tests` and `6_Student_write_tests` are each worth 5 points.
  - The cucumber tests `7_StudentTeam_create_from_team_tests` and `7_StudentTeam_create_from_student_tests` are worth 2 points each.
  - The total value of all cucumber tests are 42 points, making the cumulative score on automated testing 85 points.


2. You have been given a solution to Phase 2 that is working and 100 percent test covered. There are also a few additional methods in the models that were not part of the Phase 2 assignment, but could be helpful here and you might want review before coding controllers. If you make any changes to the models (why would be a mystery, but it is possible) then be sure that it remains at 100 percent test coverage.  Failure to do so will lead to a 15 point penalty (along the lines of Phase 2).

3. The remaining points will be assessed by the TA after running your project and reviewing its design.  There are a number of design issues discussed in class ("no unordered lists" and hte like) that will be looked for as well as an assessment of the visual appeal of the app overall.  More details about interactions, tradeoffs, and user-centered design will be covered in class.

4. Code quality issues will be assessed, but only as a penalty this time.  You will not get any points for code quality (we expect that) but can lose points for messy code.
  
5. If you want to run the context used for the cucumber tests in your development environment, you can run the command `rake db:contexts` on the command line and it will destroy your old database, re-migrate your database, set up the test database and then load the testing context.

6. The following command will run your cucumber tests: `bundle exec cucumber`. That said, there are two caveats.  First, you will need to run `rails db:test:prepare` before running your cucumber test; that's handled for you when you run `rake db:contexts` in advance.  Second, running your cucumber tests without first passing controller tests will lead to some confusing results.  As easy as they are to understand, don't start this project trying to pass the cucumber tests.  

7. If your design is very different and not able to pass the cucumber tests, discuss it with Prof. Houda to see if you are eligible for an exception.  All exceptions to cucumber tests must be granted in advance of the project's due date.

8. You have a private repository on GitHub for this project which is accessible (initially) only to you and the teaching staff.  If you change the visibility of your repository in any way or give any other individuals outside the faculty and TA access (directly or indirectly) to this repository, you can expect an automatic zero for this project, an additional one-letter grade drop on the final grade, and this will be considered an academic violation that will be reported to the University.  _We will use the full range of monitoring tools that GitHub provided to classrooms to actively scan for such violations._

9. Your project will be turned in via GitHub and Gradescope **no later than 11:59pm ET on Sunday, April 4, 2021.** Any late submissions will be not be considered (we can and will roll back any late submissions) and even making a late submission will be an automatic 5 point penalty, just for making us go through the hassle of performing a rollback.  More information about the turn-in process will be discussed later in class. 

Again, if you have questions regarding this project, please post them on Piazza or ask someone well in advance of the turn-in date. Waiting until the day before it is due to get help is unwise -- you risk not getting a timely response that close to the deadline and will not be given an extension because of such an error.

**Checkpoints for this phase**:

- _Checkpoint 1:_ The `OrganizationsController` and `HomeController` must be written and passing their tests by **Thursday, March 25th**.

- _Checkpoint 2:_ The `StudentsController`, `TeamsController `, and `StudentTeamsController` (only part 1 required) and must be written and passing their tests by **Sunday, March 30th**.

These checkpoints are minimal requirements -- if all you do is the minimum, it will put a lot of stress on the final week with cucumber testing.


