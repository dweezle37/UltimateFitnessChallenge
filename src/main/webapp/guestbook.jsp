<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>
<%
    String fbKey = request.getParameter("key");
    if (fbKey == null) {
        fbKey = "123ABC";
    }
    pageContext.setAttribute("fbKey", fbKey);
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
        pageContext.setAttribute("user", user);
%>

<center><h1>Ultimate Fitness challenge</h1></center>
<p align="right">USER: ${fn:escapeXml(user.nickname)}! FBKEY: <%= fbKey %> (
    <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
} else {
%>
<p align="right">Hello!
    <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
    to include your name with greetings you post.</p>
<%
    }
%>

<%
    //DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    //Key fitbitKey = KeyFactory.createKey("FitbitKey", fbkey);
    // Run an ancestor query to ensure we see the most up-to-date
    // view of the Greetings belonging to the selected Guestbook.
    //Query query = new Query("stats", fitbitKey).addSort("date", Query.SortDirection.DESCENDING);
    //List<Entity> stats = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(5));
    //if (stats.isEmpty()) {
%>
<table border=1 align="left">
<tr>
  <th>&nbsp;</th>
  <th>${fn:escapeXml(user.nickname)}</th>
</tr>
<tr>
  <th>Starting TrendWeight</th>
  <td>123</td>
</tr>
<tr>
  <th>Ending TrendWeight</th>
  <td>124</td>
</tr>
<tr>
  <th>Weekly Weight % Loss</th>
  <td>1</td>
</tr>
<tr>
  <th>Weekly Minutes Exercising</th>
  <td>60</td>
</tr>
<tr>
  <th>Total Floors</th>
  <td>15</td>
</tr>
<tr>
  <th>Total Steps</th>
  <td>23021</td>
</tr>
</table>


<%--
<%
} else {
%>
<p>Messages in Guestbook '${fn:escapeXml(guestbookName)}'.</p>
<%
    for (Entity greeting : greetings) {
        pageContext.setAttribute("greeting_content",
                greeting.getProperty("content"));
        if (greeting.getProperty("user") == null) {
%>
<p>An anonymous person wrote:</p>
<%
} else {
    pageContext.setAttribute("greeting_user",
            greeting.getProperty("user"));
%>
<p><b>${fn:escapeXml(greeting_user.nickname)}</b> wrote:</p>
<%
    }
%>
<blockquote>${fn:escapeXml(greeting_content)}</blockquote>
<%
        }
    }
%>
--%>

<br />

<form action="/guestbook.jsp" method="get">
    <div><input type="text" name="key" value="${fn:escapeXml(fbkey)}"/></div>
    <div><input type="submit" value="Lookup FitBit Key"/></div>
</form>

</body>
</html>
