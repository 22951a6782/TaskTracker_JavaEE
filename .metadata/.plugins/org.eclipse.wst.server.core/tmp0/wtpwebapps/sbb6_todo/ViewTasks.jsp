<%@page import="beans.Task"%>
<%@page import="java.util.List"%>
<%@page import="dao.ToDoDAO, dao.ToDoDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Display Tasks</title>
</head>
<body>
    <p align="right">
        <%
            Object obj = session.getAttribute("regId");
            if (obj == null) {
                response.sendRedirect("login.jsp"); // Redirect to login if not logged in
                return;
            }
            Integer regId = (Integer) obj;
            ToDoDAO dao1 = ToDoDAOImpl.getInstance();
            String flname = dao1.getFLNameByRegID(regId);
        %>
        Welcome <%=flname%>, <a href="./LogoutServlet">Logout</a>  
    </p>

    <form method="post" action="./AddTaskServlet">
        <table border="1" style="width: 30%; margin: auto;">
            <tr>
                <th>Task Name</th>
                <td><input type="text" name="taskName" required></td>
            </tr>
            <tr>
                <th>Task Date</th>
                <td><input type="date" name="taskDate" required></td>
            </tr>
            <tr>
                <th>Task Status</th>
                <td>
                    <select name="taskStatus" required>
                        <option value="1">Not Yet Started</option>
                        <option value="2">In Progress</option>
                        <option value="3">Completed</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th><input type="submit" value="Add Task"></th>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>

    <hr/>

    <!-- Clear Completed Tasks Button -->
    <form method="post" action="./ClearCompletedTasksServlet" style="text-align: center;">
        <input type="submit" value="Clear Completed Tasks">
    </form>

    <hr/>

    <table border="1" style="width: 50%; margin: auto;">
        <tr>
            <th>Task ID</th>
            <th>Task Name</th>
            <th>Task Date</th>
            <th>Task Status</th>
            <th>Action</th>
        </tr>
        <%
            List<Task> tasks = dao1.findAllTasksByRegid(regId);
            for (Task task : tasks) {
                int taskId = task.getTaskid();
                String taskName = task.getTaskName();
                String taskDate = task.getTaskDate();
                int taskStatus = task.getTaskStatus();
        %>
        <tr <%= taskStatus == 3 ? "style='text-decoration:line-through;'" : "" %>>
            <td><%= taskId %></td>
            <td><%= taskName %></td>
            <td><%= taskDate %></td>
            <td>
                <%= taskStatus == 1 ? "Not Yet Started" : taskStatus == 2 ? "In Progress" : "Completed" %>
            </td>
            <td>
                <% if (taskStatus != 3) { %>
                    <a href="MarkTaskCompletedServlet?taskId=<%= taskId %>">Complete</a>
                <% } else { %>
                    Completed
                <% } %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
