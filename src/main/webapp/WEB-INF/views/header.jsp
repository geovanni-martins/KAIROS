<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 02/05/2026
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="nav-header
w-screen h-16 bg-[var(--color-principal-sec)] flex items-center px-4 relative">
    <img src="${pageContext.request.contextPath}/icons/menu.svg"
         class="w-8 cursor-pointer"
         onclick="toggleSidebar()" alt="Menu">

    <h1 class="absolute left-1/2 -translate-x-1/2">
        KAIROS
    </h1>

    <a href="${pageContext.request.contextPath}/logout" class="ml-auto">
        <img src="${pageContext.request.contextPath}/icons/logout.svg"
             class="w-8 cursor-pointer" alt="Sair">
    </a>
</header>

