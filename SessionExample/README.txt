This is a Java project which demonstrates use of sessions in JSP. Simply open up login.jsp and hit run from Eclipse to start project.

Once the project is running, navigate to http://localhost:8080/SessionExample/login.jsp. The first box is a username and the second is a password (both can be anything you wish).

After hitting submit, the username and password are stored in the session. The greeting.jsp page uses this saved session variable to greet the current user.

Note that the User class implements java.io.Serializable so that you can store it in a session. (java.io.Serializable is technically an empty interface that simply serves as an indicator that a class can be serialized).