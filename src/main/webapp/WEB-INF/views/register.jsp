<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 27/04/2026
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-surface text-content">

<%
    String error = (String) request.getAttribute("error");
%>

<% if (error != null) { %>
<div id="alert-error" class="mb-4 flex items-center justify-between rounded-xl bg-red-500/20 border border-red-500/40 text-red-300 px-4 py-3 text-sm">

    <span><%= error %></span>

    <button onclick="closeAlert('alert-error')" class="ml-4 text-red-300 hover:text-white text-lg font-bold">
        &times;
    </button>
</div>
<% } %>

<main class="min-h-screen flex items-center justify-center px-4 py-8">
    <section class="w-full max-w-lg rounded-[28px] border border-white/10 bg-surface p-6 shadow-[0_25px_80px_rgba(0,0,0,0.35)] backdrop-blur-xl sm:p-8">


        <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-6">

            <div class="space-y-2">
                <label for="name" class="block text-sm font-semibold tracking-[0.18em] text-muted">NOME COMPLETO</label>

                <input id="name" name="name" type="text" minlength="4" maxlength="100" required placeholder="Seu nome"
                       class="w-full rounded-2xl border border-divider bg-surface px-4 py-3 text-sm text-content outline-none transition duration-200 focus:border-brand focus:ring-2 focus:ring-brand/20">
            </div>
            <div class="space-y-2">

                <label for="email" class="block text-sm font-semibold uppercase tracking-[0.18em] text-muted">Email</label>

                <input id="email" name="email" type="email" minlength="8" maxlength="100" required placeholder="aluno@kairos.com.br"
                       class="w-full rounded-2xl border border-divider bg-surface px-4 py-3 text-sm text-content outline-none transition duration-200 focus:border-brand focus:ring-2 focus:ring-brand/20">
            </div>
            <div class="space-y-2">

                <label for="password" class="block text-sm font-semibold uppercase tracking-[0.18em] text-muted">Senha</label>

                <input id="password" name="password" type="password" minlength="8" maxlength="70" required placeholder="••••••••"
                       class="w-full rounded-2xl border border-divider bg-surface px-4 py-3 text-sm text-content outline-none transition duration-200 focus:border-brand focus:ring-2 focus:ring-brand/20">
            </div>

            <div class="flex items-start gap-3">
                <input id="terms" type="checkbox" required
                       class="mt-1 h-4 w-4 rounded border border-divider bg-surface text-brand transition duration-200 focus:outline-none focus:ring-2 focus:ring-brand/30 checked:border-brand checked:bg-brand">

                <label for="terms" class="text-sm leading-6 text-content">
                    Li e concordo com os
                    <a href="${pageContext.request.contextPath}/termos" class="font-semibold text-brand hover:underline">Termos de Uso e Política de Privacidade</a>.
                </label>
            </div>

            <input type="hidden" name="role" value="student">
            <input type="hidden" name="responsibleDiscipline" value="null">

            <button type="submit" class="flex w-full items-center justify-center rounded-2xl bg-brand px-4 py-3 text-sm font-semibold text-content">
                Criar conta
            </button>
        </form>


        <div class="mt-6 border-t border-white/10   pt-5 text-center text-sm text-content">
            <span>Já possui conta?</span>

            <a href="${pageContext.request.contextPath}/login" class="font-semibold text-brand hover:text-brand-dark">Entrar na conta</a>
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
