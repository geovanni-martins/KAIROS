<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 05/05/2026
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Cadastrar Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-background text-content font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex flex-col items-start">

    <a href="${pageContext.request.contextPath}/admin-panel" class="self-start mb-6 inline-flex items-center gap-2 text-content hover:text-brand transition-colors">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Voltar
    </a>

    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-brand text-[11px] font-semibold tracking-widest uppercase mb-1">Administração</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Cadastrar Administrador</h1>
            <p class="text-muted text-[12px] md:text-[13px] mt-1">Preencha os dados do novo administrador do sistema</p>
        </header>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div id="success-alert" class="flex items-center gap-3 mb-6 p-4 bg-success/10 border border-success/30 rounded-xl text-success text-[13px] font-semibold transition-opacity duration-500">
            Administrador cadastrado com sucesso!
        </div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
        <div class="flex items-center gap-3 mb-6 p-4 bg-danger/10 border border-danger/30 rounded-xl text-danger text-[13px] font-semibold">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/admin/createAdmin" method="POST" class="space-y-5 md:space-y-6">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Nome</label>
                    <input type="text" name="name" required placeholder="Nome completo"
                           class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
                </div>
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">E-mail</label>
                    <input type="email" name="email" required placeholder="email@exemplo.com"
                           class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
                </div>
            </div>

            <div class="space-y-2">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Senha</label>
                <input type="password" name="password" required placeholder="Senha inicial"
                       class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
            </div>

            <div class="p-4 bg-brand/5 border border-brand/20 rounded-xl">
                <p class="text-[12px] text-muted leading-relaxed">
                    <span class="text-brand font-semibold">Atenção:</span> Administradores têm acesso total ao sistema, incluindo criação de outros usuários e gerenciamento geral. Certifique-se de que esta pessoa deve ter esse nível de acesso.
                </p>
            </div>

            <div class="flex justify-end pt-4">
                <button type="submit"
                        class="w-full md:w-auto px-8 py-3.5 md:py-3 bg-gradient-to-r from-brand to-brand-dark text-white text-[14px] font-semibold rounded-xl hover:opacity-90 active:scale-[.98] transition-all">
                    Cadastrar administrador
                </button>
            </div>

        </form>
    </div>

    <script>
        const alert = document.getElementById('success-alert');
        if (alert) {
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 500);
            }, 3000);
        }
    </script>
</main>
</body>
</html>
