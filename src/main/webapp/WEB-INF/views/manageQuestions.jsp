<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Question, com.kairos.model.Alternative, com.kairos.model.Topic, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Listar e Excluir Questões</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-background text-content font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

    <div class="flex justify-between items-start mb-6">
        <div>
            <a href="${pageContext.request.contextPath}/moderator-panel" class="mb-4 inline-flex items-center gap-2 text-content hover:text-brand transition-colors text-[14px]">
                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
                Painel do Moderador
            </a>
            <p class="text-brand text-[11px] font-semibold tracking-widest uppercase mb-1">Moderação</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Banco de Questões</h1>
            <p class="text-muted text-[12px] md:text-[13px] mt-1">Verifique ou exclua questões cadastradas.</p>
        </div>

        <a href="${pageContext.request.contextPath}/createQuestion" class="px-6 py-3 bg-gradient-to-r from-brand to-brand-dark text-white text-[13px] font-semibold rounded-xl hover:opacity-90 transition-all flex items-center gap-2">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
            Nova Questão
        </a>
    </div>

    <div class="mb-8 bg-surface p-4 rounded-2xl border border-divider flex items-center gap-4">
        <span class="text-[13px] font-semibold text-muted">Filtrar por Tópico:</span>
        <form action="${pageContext.request.contextPath}/manageQuestions" method="GET" class="flex-1 max-w-sm">
            <select name="topicId" onchange="this.form.submit()" class="w-full bg-background border border-divider rounded-xl px-4 py-2.5 text-[13px] text-white outline-none focus:border-brand transition-colors cursor-pointer">
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
    <div id="alert-msg" class="flex items-center gap-3 mb-6 p-4 bg-danger/10 border border-danger/30 rounded-xl text-danger text-[13px] font-semibold transition-opacity duration-500">
        Questão excluída permanentemente do sistema
    </div>
    <% } %>

    <div class="space-y-6">
        <%
            List<Question> questions = (List<Question>) request.getAttribute("questions");
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

                for (Question q : questions) {

                    String diffColor = "";
                    String diffText = "";

                    if ("easy".equals(q.getDifficulty())) {
                        diffColor = "text-success";
                        diffText = "Fácil";
                    } else if ("medium".equals(q.getDifficulty())) {
                        diffColor = "text-warning";
                        diffText = "Média";
                    } else {
                        diffColor = "text-danger";
                        diffText = "Difícil";
                    }
        %>

        <div class="p-5 md:p-6 bg-surface border border-divider rounded-2xl shadow-lg">

            <div class="flex justify-between items-start mb-4">
                <span class="px-3 py-1 bg-surface-hover text-muted text-[11px] font-bold rounded-lg uppercase tracking-wider">
                    ID: <%= q.getId() %> | Tópico: <%= q.getTopic().getName() %>
                </span>
                <span class="px-3 py-1 border border-divider text-[11px] font-bold rounded-lg uppercase tracking-wider <%= diffColor %>">
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

                        String containerClass = "border-divider bg-background";
                        String circleClass = "border-muted text-muted";
                        String textClass = "text-muted";
                        String answerKeyLabel = "";

                        if (isCorrect) {
                            containerClass = "border-success bg-success/5";
                            circleClass = "border-success text-success";
                            textClass = "text-success font-semibold";
                            answerKeyLabel = "(Gabarito)";
                        }
                %>
                <div class="flex items-center gap-3 p-3 rounded-xl border <%= containerClass %>">
                    <div class="flex items-center justify-center w-6 h-6 rounded-full border text-[11px] font-bold font-mono <%= circleClass %>">
                        <%= labels[i % labels.length] %>
                    </div>
                    <span class="text-[13px] <%= textClass %>">
                        <%= alt.getText() %> <%= answerKeyLabel %>
                    </span>
                </div>
                <% } %>
            </div>

            <div class="flex justify-end pt-4 border-t border-divider">
                <form id="form-delete-question-<%= q.getId() %>" action="${pageContext.request.contextPath}/deleteQuestion" method="POST">
                    <input type="hidden" name="questionId" value="<%= q.getId() %>">
                    <button type="button" onclick="openModal(<%= q.getId() %>)" class="cursor-pointer flex items-center gap-2 px-4 py-2 bg-danger/10 text-danger hover:bg-danger hover:text-white rounded-xl text-[13px] font-semibold transition-colors">
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
        <div class="p-8 bg-surface border border-divider rounded-2xl text-center">
            <p class="text-content text-[15px] font-bold">Nenhuma questão encontrada para este tópico.</p>
        </div>
        <% } %>
    </div>

    <div id="delete-modal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/60 backdrop-blur-sm transition-opacity duration-300 opacity-0">
        <div id="modal-content" class="bg-surface border border-divider rounded-2xl shadow-2xl p-6 w-[90%] max-w-md transform scale-95 transition-transform duration-300">

            <div class="flex items-center gap-3 mb-4 text-danger">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                <h2 class="text-[20px] font-bold text-white">Excluir Questão</h2>
            </div>

            <p class="text-muted text-[14px] mb-6 leading-relaxed">
                Você tem certeza absoluta que deseja excluir a <strong class="text-white" id="question-id-text">Questão</strong>?<br>
                Isso apagará a pergunta e todas as suas alternativas. Esta ação <span class="text-danger font-semibold">não pode ser desfeita</span>.
            </p>

            <div class="flex justify-end gap-3">
                <button onclick="closeModal()" class="cursor-pointer px-5 py-2.5 rounded-xl text-[13px] font-semibold text-muted bg-background border border-divider hover:text-white hover:bg-surface-hover transition-colors">
                    Cancelar
                </button>
                <button id="confirm-delete-button" class="cursor-pointer px-5 py-2.5 rounded-xl text-[13px] font-semibold text-white bg-danger hover:bg-opacity-80 transition-colors">
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

        let questionFormToSubmit = null;
        const modal = document.getElementById('delete-modal');
        const modalContent = document.getElementById('modal-content');

        function openModal(questionId) {
            questionFormToSubmit = 'form-delete-question-' + questionId;
            document.getElementById('question-id-text').innerText = 'Questão ' + questionId;

            modal.classList.remove('hidden');
            modal.classList.add('flex');

            setTimeout(function() {
                modal.classList.remove('opacity-0');
                modalContent.classList.remove('scale-95');
                modalContent.classList.add('scale-100');
            }, 10);
        }

        function closeModal() {
            modal.classList.add('opacity-0');
            modalContent.classList.remove('scale-100');
            modalContent.classList.add('scale-95');

            setTimeout(function() {
                modal.classList.remove('flex');
                modal.classList.add('hidden');
                questionFormToSubmit = null;
            }, 300);
        }

        document.getElementById('confirm-delete-button').addEventListener('click', function() {
            if (questionFormToSubmit !== null) {
                document.getElementById(questionFormToSubmit).submit();
            }
        });
    </script>
</main>
</body>
</html>