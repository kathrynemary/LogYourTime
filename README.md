--Running the Program--
#To run program, uncomment TimeLogApp.run in time_log_app.rb

#Then, in the project's main directory, type "ruby time_log_app.rb". You should be prompted to enter information from there.

#If there are no employees saved yet, you will be prompted to set up your own account before proceeding to the log-in screen.

--Tests--
#Some tests are commented out. This is because I needed to check whether certain examples could be instantiated successfully, but have checks to ensure that the same user is not added more than once. For example, after an employee has been added, the list of employees will return that employee with the 'add employee' method commented out. If it tries to add the employee again every time the test suite is run, an error message will arise.

--More Information--
#For more information, see the reference file in the folder of the same name.
