<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    // Handle form submission
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("Name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("psw");

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO users (Name, mobile, email, password) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, name);
                pstmt.setString(2, mobile);
                pstmt.setString(3, email);
                pstmt.setString(4, password);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect or display a thank you message
        response.sendRedirect("thankyou.jsp");
    }
%>

<!-- Your existing HTML form code goes here -->
