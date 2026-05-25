<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 06/05/2026
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-surface text-content">

<%
    String error = (String) request.getAttribute("error");
    String success = (String) request.getAttribute("success");
%>

<% if (error != null) { %>
<div id="alert-error" class="mb-4 flex items-center justify-between rounded-xl bg-red-500/20 border border-red-500/40 text-red-300 px-4 py-3 text-sm">

    <span><%= error %></span>

    <button onclick="closeAlert('alert-error')" class="ml-4 text-red-300 hover:text-white text-lg font-bold">
        &times;
    </button>
</div>
<% } %>

<% if (success != null) { %>
<div id="alert-success" class="mb-4 flex items-center justify-between rounded-xl bg-success/20 border border-success/40 text-success px-4 py-3 text-sm">

    <span><%= success %></span>

    <button onclick="closeAlert('alert-success')" class="ml-4 text-success hover:text-white text-lg font-bold">
        &times;
    </button>
</div>
<%
    session.removeAttribute("success");
%>
<% } %>

<main class="min-h-screen flex items-center justify-center px-4 py-8">
    <section class="w-full max-w-lg rounded-[28px] border border-white/10 bg-surface p-6 shadow-[0_25px_80px_rgba(0,0,0,0.35)] backdrop-blur-xl sm:p-8">
        <form action="${pageContext.request.contextPath}/new-password" method="post" class="space-y-6">
            <div class="space-y-2">
                <label for="email" class="block text-sm font-semibold tracking-[0.18em] text-muted">Email</label>
                <input id="email" name="email" type="email" minlength="8" maxlength="100" required placeholder="aluno@kairos.com.br"
                       class="w-full rounded-2xl border border-divider bg-surface px-4 py-3 text-sm text-content outline-none transition duration-200 focus:border-brand focus:ring-2 focus:ring-brand/20">
            </div>

            <div class="space-y-2">
                <label for="password" class="block text-sm font-semibold tracking-[0.18em] text-muted">Senha Atual</label>
                <input id="password" name="password" type="password" minlength="8" maxlength="70" required placeholder="••••••••"
                       class="w-full rounded-2xl border border-divider bg-surface px-4 py-3 text-sm text-content outline-none transition duration-200 focus:border-brand focus:ring-2 focus:ring-brand/20">
            </div>

            <div class="space-y-2">
                <label for="newPassword" class="block text-sm font-semibold tracking-[0.18em] text-muted">Nova Senha</label>
                <input id="newPassword" name="newPassword" type="password" minlength="8" maxlength="70" required placeholder="••••••••"
                       class="w-full rounded-2xl border border-divider bg-surface px-4 py-3 text-sm text-content outline-none transition duration-200 focus:border-brand focus:ring-2 focus:ring-brand/20">
            </div>

            <button type="submit" class="flex w-full items-center justify-center rounded-2xl bg-brand px-4 py-3 text-sm font-semibold text-content transition duration-200 hover:bg-brand-dark">
                Enviar
            </button>
        </form>

        <div class="mt-6 border-t border-white/10 pt-5 text-center text-sm text-content">
            <a href="${pageContext.request.contextPath}/login" class="font-semibold text-brand hover:text-brand-dark">Voltar</a>
        </div>
    </section>
</main>
</body>
<script>
    function closeAlert(id) {
        const el = document.getElementById(id);
        if (el) {
            el.style.opacity = '0';
            setTimeout(() => el.remove(), 300);
        }
    }
</script>

</html>
