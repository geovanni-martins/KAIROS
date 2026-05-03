<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 27/04/2026
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

        :root {
            --font-principal: 'Inter', sans-serif;
            --color-principal: #1D2B48;
            --color-principal-sec: #161F35;
            --color-sec: #E16144;
            --color-sec-sec: #C9523A;
            --color-text: #E8EDF8;
        }

        body {
            margin: 0;
        }

        .nav-header img {
            filter: brightness(0) saturate(100%) invert(92%) sepia(6%) saturate(500%) hue-rotate(180deg);
        }

        .nav-header {
            font-family: var(--font-principal);
            color: var(--color-text);
        }

    </style>
</head>
<body>
    <%@include file="nav.jsp"%>
    <%@include file="header.jsp"%>
      <h1>Registrou/logou</h1>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById("sidebar");
            sidebar.classList.toggle("-translate-x-full");
        }
    </script>
</body>
</html>
