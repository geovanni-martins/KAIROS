<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 05/05/2026
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Painel de Administrador</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-background text-content font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex items-center justify-center">

    <div class="w-full max-w-4xl">
        <header class="mb-10 text-center">
            <p class="text-brand text-[11px] font-semibold tracking-widest uppercase mb-2">Administração</p>
            <h1 class="text-[28px] md:text-[32px] font-bold">Painel de Ferramentas</h1>
        </header>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-5 md:gap-6">

            <a href="${pageContext.request.contextPath}/admin/createModerator" class="group flex flex-col items-center text-center p-8 bg-surface border border-divider rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-brand hover:shadow-brand/10">
                <div class="w-16 h-16 rounded-full bg-brand/10 flex items-center justify-center text-brand mb-5 transition-colors duration-300 group-hover:bg-brand group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M22 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/>
                    </svg>
                </div>
                <h2 class="text-content text-[16px] font-bold mb-2">Cadastrar Moderador</h2>
                <p class="text-muted text-[12px] leading-relaxed">Adicione novos moderadores e defina suas matérias responsáveis</p>
            </a>

            <a href="${pageContext.request.contextPath}/admin/createAdmin" class="group flex flex-col items-center text-center p-8 bg-surface border border-divider rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-brand hover:shadow-brand/10">
                <div class="w-16 h-16 rounded-full bg-brand/10 flex items-center justify-center text-brand mb-5 transition-colors duration-300 group-hover:bg-brand group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                        <path d="M9 12l2 2 4-4"/>
                    </svg>
                </div>
                <h2 class="text-content text-[16px] font-bold mb-2">Cadastrar Admin</h2>
                <p class="text-muted text-[12px] leading-relaxed">Adicione novos administradores ao sistema</p>
            </a>

            <a href="${pageContext.request.contextPath}/admin/users" class="group flex flex-col items-center text-center p-8 bg-surface border border-divider rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-brand hover:shadow-brand/10">
                <div class="w-16 h-16 rounded-full bg-brand/10 flex items-center justify-center text-brand mb-5 transition-colors duration-300 group-hover:bg-brand group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/>
                    </svg>
                </div>
                <h2 class="text-content text-[16px] font-bold mb-2">Gerenciar Usuários</h2>
                <p class="text-muted text-[12px] leading-relaxed">Visualize, pesquise e remova usuários do sistema</p>
            </a>

        </div>
    </div>
</main>
</body>
</html>