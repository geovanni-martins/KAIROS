<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 02/05/2026
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="sidebar"
     class="nav-header
     fixed left-0 top-16 w-64 h-[calc(100dvh-4rem)] flex flex-col
bg-[var(--color-principal-sec)]
transform -translate-x-full transition-transform duration-300">

    <div class="flex flex-row p-3 hover:bg-[#1e2842]">

        <img src="${pageContext.request.contextPath}/icons/lacunas.svg" alt="Lacunas" class="w-5 mr-2">
        <a href="#">Lacunas</a>

    </div>

    <div class="flex flex-row p-3 hover:bg-[#1e2842]">

        <img src="${pageContext.request.contextPath}/icons/questoes.svg" alt="Questões" class="w-5 mr-2">
        <a href="#">Questões</a>

    </div>

    <%
        String userType = (String) session.getAttribute("userType");
    %>

    <% if ("admin".equals(userType)) { %>
    <a href="#" class="cursor-pointer">
        <div class="flex p-3 hover:bg-[#1e2842]">
            <img src="${pageContext.request.contextPath}/icons/settings.svg" alt="Configurações" class="w-5 mr-2">
            Painel administrador
        </div>
    </a>
    <% } %>

    <% if ("moderator".equals(userType)) { %>
    <a href="#" class="cursor-pointer">
        <div class="flex p-3 hover:bg-[#1e2842]">
            <img src="${pageContext.request.contextPath}/icons/admin-mod.svg" alt="Questões" class="w-5 mr-2">
            Painel moderador
        </div>
    </a>
    <% } %>

    <a href="#" class="cursor-pointer">
        <div class="mt-auto flex p-3 hover:bg-[#1e2842]">
            <img src="${pageContext.request.contextPath}/icons/settings.svg" alt="Questões" class="w-5 mr-2">
            Configurações
        </div>
    </a>
</nav>
