<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Users </title>
    </head>
    <body>
        <h1> Add a user</h1>

        <form method="post" action="users">
            <label> Email: </label>
            <input type="text" name="email" value="">
            <br>
            <label> First name: </label>
            <input type="text" name="firstName" value="">
            <br>
            <label> Last name: </label>
            <input type="text" name="lastName" value="">
            <br>
            <label> Password: </label>
            <input type="text" name="password" value="">
            <br>
            <label> Role: </label>
            <select id="select_role" name="user_role">
                <option value="system_admin"> System administrator </option>
                <option value="regular_user"> Regular User </option>
                <option value="company_admin"> Company administrator </option>
            </select>
            <br>

            <input type="submit" value="save">
            <input type="hidden" name="action" value="new">
        </form>

        <form method="post" action="users">
            <h2> Manage users</h2>
            <table>
                <tr>
                    <th> Email</th>
                    <th> First name</th>
                    <th> Last name </th>
                    <th> Role</th>
                    <th> Status </th>
                    <th> Edit </th>
                    <th> Delete </th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr> 
                        <td> ${user.email}</td>
                        <td> ${user.firstName}</td>
                        <td> ${user.lastName}</td>
                        <td> ${user.role}</td>
                        <td> ${user.isActive}</td>
                        <td> <input type="submit" value="Edit"><input type="hidden" name="action" value="edit" </td>
                        <td> <input type="submit" value="Delete"><input type="hidden" name="action" value="delete" </td>
                    </tr>
                </c:forEach>
            </table>
        </form>

        <c:if test="action.equals('edit')">
            <h2> Edit user </h2>
            <form method="post" action="users">
                <label> First name: </label>
                <input type="text" name="firstName" value="${email}">
                <br>
                <label> First name: </label>
                <input type="text" name="firstName" value="">
                <br>
                <label> Last name: </label>
                <input type="text" name="lastName" value="">
                <br>
                <label> Password: </label>
                <input type="text" name="password" value="">
                <br>
                <label> Role: </label>
                <select id="select_role" name="user_role">
                    <option value="system_admin"> System administrator </option>
                    <option value="regular_user"> Regular User </option>
                    <option value="company_admin"> Company administrator </option>
                </select>
                <br>
                
                <input type="submit" value="save">
                <input type="hidden" name="action" value="save">

            </form>
        </c:if>
    </body>
</html>
