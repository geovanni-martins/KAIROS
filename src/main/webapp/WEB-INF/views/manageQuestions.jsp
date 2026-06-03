<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.MultipleChoiceQuestion, com.kairos.model.Alternative, com.kairos.model.Topic, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Listar e Excluir Questões</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style type="text/tailwindcss">
        @theme {
            --color-fundo-geral: #0B101E;
            --color-fundo-card: #161F35;
            --color-fundo-hover: #1D2B48;
            --color-linha-divisoria: #1D2B48;
            --color-marca-kairos: #E16144;
            --color-marca-escuro: #C9523A;
            --color-texto-padrao: #ffffff;
            --color-texto-opaco: #8494b0;
            --color-status-verde: #22c55e;
            --color-status-amarelo: #f59e0b;
            --color-status-vermelho: #E16144;
            --font-sora: "Sora", sans-serif;
            --font-mono: "JetBrains Mono", monospace;
        }
    </style>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

    <div class="flex justify-between items-start mb-6">
        <div>
            <a href="${pageContext.request.contextPath}/moderator-panel" class="mb-4 inline-flex items-center gap-2 text-texto-padrao hover:text-marca-kairos transition-colors text-[14px]">
                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
                Painel do Moderador
            </a>
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-1">Moderação</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Banco de Questões</h1>
            <p class="text-texto-opaco text-[12px] md:text-[13px] mt-1">Verifique ou exclua questões cadastradas.</p>
        </div>

        <a href="${pageContext.request.contextPath}/createQuestion" class="px-6 py-3 bg-gradient-to-r from-marca-kairos to-marca-escuro text-white text-[13px] font-semibold rounded-xl hover:opacity-90 transition-all flex items-center gap-2">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
            Nova Questão
        </a>
    </div>

    <div class="mb-8 bg-fundo-card p-4 rounded-2xl border border-linha-divisoria flex items-center gap-4">
        <span class="text-[13px] font-semibold text-texto-opaco">Filtrar por Tópico:</span>
        <form action="${pageContext.request.contextPath}/manageQuestions" method="GET" class="flex-1 max-w-sm">
            <select name="topicId" onchange="this.form.submit()" class="w-full bg-fundo-geral border border-linha-divisoria rounded-xl px-4 py-2.5 text-[13px] text-white outline-none focus:border-marca-kairos transition-colors cursor-pointer">
                <option value="">Mostrar Todas as Questões</option>
                <%
                    List<Topic> allTopics = (List<Topic>) request.getAttribute("topics");
                    String selectedTopic = (String) request.getAttribute("selectedTopic");

                    if (allTopics != null) {
                        for (Topic t : allTopics) {
                            String isSelected = "";
                            if (selectedTopic != null && selectedTopic.equals(String.valueOf(t.getId()))) {
                                isSelected = "selected";
                            }
                %>
                <option value="<%= t.getId() %>" <%= isSelected %>><%= t.getName() %></option>
                <%      }
                }
                %>
            </select>
        </form>
    </div>

    <% if ("true".equals(request.getParameter("deleted"))) { %>
    <div id="alert-msg" class="flex items-center gap-3 mb-6 p-4 bg-status-vermelho/10 border border-status-vermelho/30 rounded-xl text-status-vermelho text-[13px] font-semibold transition-opacity duration-500">
        Questão excluída permanentemente do sistema
    </div>
    <% } %>

    <div class="space-y-6">
        <%
            List<MultipleChoiceQuestion> questions = (List<MultipleChoiceQuestion>) request.getAttribute("questions");
            if (questions != null && !questions.isEmpty()) {

                questions.sort((q1, q2) -> {
                    int question1;
                    if ("easy".equals(q1.getDifficulty())) {
                        question1 = 1;
                    } else if ("medium".equals(q1.getDifficulty())) {
                        question1 = 2;
                    } else {
                        question1 = 3;
                    }

                    int question2;
                    if ("easy".equals(q2.getDifficulty())) {
                        question2 = 1;
                    } else if ("medium".equals(q2.getDifficulty())) {
                        question2 = 2;
                    } else {
                        question2 = 3;
                    }

                    return Integer.compare(question1, question2);
                });

                for (MultipleChoiceQuestion q : questions) {

                    String diffColor = "";
                    String diffText = "";

                    if ("easy".equals(q.getDifficulty())) {
                        diffColor = "text-status-verde";
                        diffText = "Fácil";
                    } else if ("medium".equals(q.getDifficulty())) {
                        diffColor = "text-status-amarelo";
                        diffText = "Média";
                    } else {
                        diffColor = "text-status-vermelho";
                        diffText = "Difícil";
                    }
        %>

        <div class="p-5 md:p-6 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg">

            <div class="flex justify-between items-start mb-4">
                <span class="px-3 py-1 bg-fundo-hover text-texto-opaco text-[11px] font-bold rounded-lg uppercase tracking-wider">
                    ID: <%= q.getId() %> | Tópico: <%= q.getTopic().getName() %>
                </span>
                <span class="px-3 py-1 border border-linha-divisoria text-[11px] font-bold rounded-lg uppercase tracking-wider <%= diffColor %>">
                    <%= diffText %>
                </span>
            </div>

            <p class="text-[14px] leading-relaxed mb-4 text-white"><%= q.getStatement() %></p>

            <div class="space-y-2 mb-6">
                <%
                    List<Alternative> alts = q.getAlternatives();
                    String[] labels = {"A", "B", "C", "D", "E"};

                    for (int i = 0; i < alts.size(); i++) {
                        Alternative alt = alts.get(i);

                        boolean isCorrect = false;

                        if (alt.getCorrect() != null) {
                            isCorrect = alt.getCorrect();
                        }

                        String containerClass = "border-linha-divisoria bg-fundo-geral";
                        String circleClass = "border-texto-opaco text-texto-opaco";
                        String textClass = "text-texto-opaco";
                        String gabaritoLabel = "";

                        if (isCorrect) {
                            containerClass = "border-status-verde bg-status-verde/5";
                            circleClass = "border-status-verde text-status-verde";
                            textClass = "text-status-verde font-semibold";
                            gabaritoLabel = "(Gabarito)";
                        }
                %>
                <div class="flex items-center gap-3 p-3 rounded-xl border <%= containerClass %>">
                    <div class="flex items-center justify-center w-6 h-6 rounded-full border text-[11px] font-bold font-mono <%= circleClass %>">
                        <%= labels[i % labels.length] %>
                    </div>
                    <span class="text-[13px] <%= textClass %>">
                        <%= alt.getText() %> <%= gabaritoLabel %>
                    </span>
                </div>
                <% } %>
            </div>

            <div class="flex justify-end pt-4 border-t border-linha-divisoria">
                <form id="form-delete-question-<%= q.getId() %>" action="${pageContext.request.contextPath}/deleteQuestion" method="POST">
                    <input type="hidden" name="questionId" value="<%= q.getId() %>">
                    <button type="button" onclick="abrirModal(<%= q.getId() %>)" class="cursor-pointer flex items-center gap-2 px-4 py-2 bg-status-vermelho/10 text-status-vermelho hover:bg-status-vermelho hover:text-white rounded-xl text-[13px] font-semibold transition-colors">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                        Excluir Questão
                    </button>
                </form>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="p-8 bg-fundo-card border border-linha-divisoria rounded-2xl text-center">
            <p class="text-texto-padrao text-[15px] font-bold">Nenhuma questão encontrada para este tópico.</p>
        </div>
        <% } %>
    </div>

    <div id="modal-exclusao" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/60 backdrop-blur-sm transition-opacity duration-300 opacity-0">
        <div id="modal-conteudo" class="bg-fundo-card border border-linha-divisoria rounded-2xl shadow-2xl p-6 w-[90%] max-w-md transform scale-95 transition-transform duration-300">

            <div class="flex items-center gap-3 mb-4 text-status-vermelho">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                <h2 class="text-[20px] font-bold text-white">Excluir Questão</h2>
            </div>

            <p class="text-texto-opaco text-[14px] mb-6 leading-relaxed">
                Você tem certeza absoluta que deseja excluir a <strong class="text-white" id="texto-id-questao">Questão</strong>?<br>
                Isso apagará a pergunta e todas as suas alternativas. Esta ação <span class="text-status-vermelho font-semibold">não pode ser desfeita</span>.
            </p>

            <div class="flex justify-end gap-3">
                <button onclick="fecharModal()" class="cursor-pointer px-5 py-2.5 rounded-xl text-[13px] font-semibold text-texto-opaco bg-fundo-geral border border-linha-divisoria hover:text-white hover:bg-fundo-hover transition-colors">
                    Cancelar
                </button>
                <button id="btn-confirmar-exclusao" class="cursor-pointer px-5 py-2.5 rounded-xl text-[13px] font-semibold text-white bg-status-vermelho hover:bg-opacity-80 transition-colors">
                    Sim, excluir
                </button>
            </div>

        </div>
    </div>

    <script>
        const alertMsg = document.getElementById('alert-msg');
        if (alertMsg) {
            setTimeout(function() {
                alertMsg.style.opacity = '0';
                setTimeout(function() { alertMsg.remove(); }, 500);
            }, 3000);
        }

        let formQuestaoParaEnviar = null;
        const modal = document.getElementById('modal-exclusao');
        const modalConteudo = document.getElementById('modal-conteudo');

        function abrirModal(idQuestao) {
            formQuestaoParaEnviar = 'form-delete-question-' + idQuestao;
            document.getElementById('texto-id-questao').innerText = 'Questão ' + idQuestao;

            modal.classList.remove('hidden');
            modal.classList.add('flex');

            setTimeout(function() {
                modal.classList.remove('opacity-0');
                modalConteudo.classList.remove('scale-95');
                modalConteudo.classList.add('scale-100');
            }, 10);
        }

        function fecharModal() {
            modal.classList.add('opacity-0');
            modalConteudo.classList.remove('scale-100');
            modalConteudo.classList.add('scale-95');

            setTimeout(function() {
                modal.classList.remove('flex');
                modal.classList.add('hidden');
                formQuestaoParaEnviar = null;
            }, 300);
        }

        document.getElementById('btn-confirmar-exclusao').addEventListener('click', function() {
            if (formQuestaoParaEnviar !== null) {
                document.getElementById(formQuestaoParaEnviar).submit();
            }
        });
    </script>
</main>
</body>
</html>