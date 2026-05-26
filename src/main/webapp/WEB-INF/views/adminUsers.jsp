<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 05/05/2026
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.User, java.util.List" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Gerenciar Usuários</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-background text-content font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex flex-col">

    <a href="${pageContext.request.contextPath}/admin-panel" class="self-start mb-6 inline-flex items-center gap-2 text-content hover:text-brand transition-colors">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Voltar
    </a>

    <div class="w-full max-w-5xl mx-auto">
        <header class="mb-8">
            <p class="text-brand text-[11px] font-semibold tracking-widest uppercase mb-1">Administração</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Gerenciar Usuários</h1>
            <p class="text-muted text-[12px] md:text-[13px] mt-1">Visualize e remova usuários do sistema</p>
        </header>

        <% if ("true".equals(request.getParameter("deleted"))) { %>
        <div id="success-alert" class="flex items-center gap-3 mb-6 p-4 bg-success/10 border border-success/30 rounded-xl text-success text-[13px] font-semibold transition-opacity duration-500">
            Usuário removido com sucesso!
        </div>
        <% } %>

        <div class="flex flex-col md:flex-row gap-3 mb-6">
            <div class="relative flex-1">
                <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-muted" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
                <input type="text" id="searchInput" placeholder="Buscar por name ou e-mail..."
                       class="w-full pl-10 pr-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
            </div>
            <select id="roleFilter" class="px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
                <option value="">Todos os perfis</option>
                <option value="admin">Administrador</option>
                <option value="moderator">Moderador</option>
                <option value="student">Aluno</option>
            </select>
        </div>

        <div class="bg-surface border border-divider rounded-2xl overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full" id="usersTable">
                    <thead>
                    <tr class="border-b border-divider">
                        <th class="text-left px-6 py-4 text-[11px] font-semibold tracking-widest uppercase text-muted">Usuário</th>
                        <th class="text-left px-6 py-4 text-[11px] font-semibold tracking-widest uppercase text-muted hidden md:table-cell">E-mail</th>
                        <th class="text-left px-6 py-4 text-[11px] font-semibold tracking-widest uppercase text-muted">Perfil</th>
                        <th class="px-6 py-4"></th>
                    </tr>
                    </thead>
                    <tbody id="usersBody">
                    <%
                        List<User> users = (List<User>) request.getAttribute("users");
                        if (users != null && !users.isEmpty()) {
                            for (User u : users) {

                                String role = u.getRole();
                                String roleLabel;
                                String roleBadge;

                                switch (role) {
                                    case "admin":
                                        roleLabel = "Admin";
                                        roleBadge = "bg-brand/15 text-brand";
                                        break;
                                    case "moderator":
                                        roleLabel = "Moderador";
                                        roleBadge = "bg-blue-500/15 text-blue-400";
                                        break;
                                    default:
                                        roleLabel = "Aluno";
                                        roleBadge = "bg-success/15 text-success";
                                        break;
                                }

                                String name = u.getName();
                                String initials = name.substring(0, Math.min(2, name.length())).toUpperCase();
                    %>
                    <tr class="border-b border-divider last:border-0 hover:bg-surface-hover/50 transition-colors user-row"
                        data-name="<%= u.getName().toLowerCase() %>"
                        data-email="<%= u.getEmail().toLowerCase() %>"
                        data-role="<%= u.getRole() %>">
                        <td class="px-6 py-4">
                            <div class="flex items-center gap-3">
                                <div class="w-9 h-9 rounded-full bg-brand/10 border border-brand/20 flex items-center justify-center text-brand text-[12px] font-bold font-mono shrink-0">
                                    <%= initials %>
                                </div>
                                <span class="text-[13px] font-semibold text-content"><%= u.getName() %></span>
                            </div>
                        </td>
                        <td class="px-6 py-4 hidden md:table-cell">
                            <span class="text-[13px] text-muted"><%= u.getEmail() %></span>
                        </td>
                        <td class="px-6 py-4">
                                <span class="inline-block px-3 py-1 rounded-full text-[11px] font-semibold <%= roleBadge %>">
                                    <%= roleLabel %>
                                </span>
                        </td>
                        <td class="px-6 py-4 text-right">
                            <%
                                User currentAdmin = (User) session.getAttribute("user");
                                if (currentAdmin != null && currentAdmin.getId() != u.getId()) { // sem essa linha, caso a sessao caisse nao daria um erro enorme 500 ()
                            %>
                                <button onclick="confirmDelete(<%= u.getId() %>, '<%= u.getName().replace("'", "\\'") %>')"
                                        class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-[12px] font-semibold text-danger border border-danger/30 hover:bg-danger hover:text-white transition-all">
                                    <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6M10 11v6M14 11v6M9 6V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>
                                    Remover
                                </button>
                            <% } %>
                        </td>
                    </tr>
                    <%      }
                    } else { %>
                    <tr>
                        <td colspan="4" class="px-6 py-12 text-center text-muted text-[13px]">Nenhum usuário cadastrado.</td>
                    </tr>
                    <%  } %>
                    </tbody>
                </table>
            </div>
        </div>

        <p id="emptySearch" class="hidden text-center text-muted text-[13px] mt-8">Nenhum usuário encontrado para essa busca.</p>
    </div>

    <div id="deleteModal" class="hidden fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm p-4">
        <div class="bg-surface border border-divider rounded-2xl p-6 w-full max-w-sm shadow-2xl">
            <div class="w-12 h-12 rounded-full bg-danger/10 flex items-center justify-center text-danger mx-auto mb-4">
                <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"/></svg>
            </div>
            <h3 class="text-[16px] font-bold text-center mb-2">Remover usuário</h3>
            <p class="text-muted text-[13px] text-center mb-6">Tem certeza que deseja remover <span id="modalUserName" class="text-content font-semibold"></span>? Esta ação não pode ser desfeita.</p>
            <div class="flex gap-3">
                <button onclick="closeModal()" class="flex-1 px-4 py-2.5 bg-surface-hover border border-divider rounded-xl text-[13px] font-semibold hover:border-muted transition-colors">
                    Cancelar
                </button>
                <form id="deleteForm" action="${pageContext.request.contextPath}/admin/deleteUser" method="POST" class="flex-1">
                    <input type="hidden" name="userId" id="deleteUserId">
                    <button type="submit" class="w-full px-4 py-2.5 bg-danger text-white rounded-xl text-[13px] font-semibold hover:opacity-90 transition-all">
                        Remover
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
        const searchInput = document.getElementById('searchInput');
        const roleFilter = document.getElementById('roleFilter');
        const rows = document.querySelectorAll('.user-row');
        const emptySearch = document.getElementById('emptySearch');

        function filterUsers() {
            const q = searchInput.value.toLowerCase();
            const role = roleFilter.value;
            let visible = 0;
            rows.forEach(row => {
                const matchText = row.dataset.name.includes(q) || row.dataset.email.includes(q);
                const matchRole = !role || row.dataset.role === role;
                if (matchText && matchRole) {
                    row.classList.remove('hidden');
                    visible++;
                } else {
                    row.classList.add('hidden');
                }
            });
            emptySearch.classList.toggle('hidden', visible > 0);
        }

        searchInput.addEventListener('input', filterUsers);
        roleFilter.addEventListener('change', filterUsers);

        function confirmDelete(id, name) {
            document.getElementById('deleteUserId').value = id;
            document.getElementById('modalUserName').textContent = name;
            document.getElementById('deleteModal').classList.remove('hidden');
        }
        function closeModal() {
            document.getElementById('deleteModal').classList.add('hidden');
        }
        document.getElementById('deleteModal').addEventListener('click', function(e) {
            if (e.target === this) closeModal();
        });

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