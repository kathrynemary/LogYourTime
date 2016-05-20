Introduction
* I like drawing out maps of how the different classes relate to each other so that I can better visualize what I have written. In this document, I will go over the class maps I have drawn, and some of my thoughts on the successes and problems of those classes.

employees_list
[employees_list class map] ("https://bitbucket.org/heyitskathryne/time_log_app/raw/master/reference/reference_pictures/employees_list.jpg")
* This class writes new names to the lists of employees and admins, as well as returning those lists when called.
* I set up this class so that does not intertwine with other classes. It refers to the .yml files that contain lists of employees and employee admins, but those are the only other files that are needed.

time_input_interface
*This class asks for and synthesizes user input into a time and date. It is used for both start and end times.
*The way the class is set up is to ask for and verify the time, then ask for and verify the date, and concatenate the values into a single string.
* One thing that is perhaps odd is that the two verification methods look at different things for time and date. The verify_time_input method checks that input matches the format of a time (one or two digits, then a colon, then two digits). The verify_date_input method checks that the date entered is not for the future. That way, people can enter a date with a number of formants (DDMMYYYY, Month Date Year, etc.) but the date entered must adhere to the project requirement of not logging time for dates in the future. There is a danger that this would be misinterpreted as the equivalent of the verify_time_input method, though.

time_log_client_totals
*This method gets a list of events for a given client, that have occurred within the past month. It also gets a sum of the minutes worked for these events.
*One quirk here is that the get_client_event calls the get_file method, which would be uneccessary if it is being invoked via the get_client_minutes_worked method (in normal use). I did this so that I could pass in the example file in my tests, rather than referencing events.yml.
*I am pleased by how much these responsibilities were broken down between the methods.

time_log_employee_totals
*This class gets the events that a given employee has worked in the past month, as well as the sum of the minutes worked in those events.
*I wrote this file very haphazardly, and looking back I can see the evidence of that. I started working on this file, getting the events that an employee had entered for the current month, then moved on to the client_totals file. While writing the client file, I figured out how to write that in a better way, as well as getting the minutes worked for the client events. I then copied and pasted some of that code back into the employee_totals file, but obviously forgot to go back and clean things up.

time_log_master
*This file gets and aggregates the data for a work event. It references four other classes as well as the events.yml file, but I do not think there is a way to further simplify the structure.
*In this class, as in the time_log_client_totals class, the set_up method that calls the file is referenced by a second method, the write_to_log method. This should be unneccessary with normal use, but it allowed me to test the class.





