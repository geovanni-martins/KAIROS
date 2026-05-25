<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kairos.model.Answer" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Desempenho - Kairos</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=DM+Serif+Text:ital@0;1&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>

<body class="bg-surface flex justify-center min-h-screen p-4 md:p-8">
	<jsp:include page="/WEB-INF/views/nav.jsp" />

    <main class="bg-surface-hover w-full max-w-3xl p-6 md:p-8 rounded-2xl shadow-lg h-fit mt-4 md:mt-10">
        
        <header class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4 border-b border-divider pb-5">
            <div>
                <h1 class="text-2xl font-sora text-white">Meu Desempenho</h1>
                <p class="text-sm text-muted mt-1">Acompanhe seu percentual de acertos por tópico</p>
            </div>

            <div class="flex items-center gap-2 bg-surface border border-divider rounded-lg px-3 py-2 w-full md:w-auto">
                
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-danger" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd" />
                </svg>

                <select class="bg-transparent text-content text-sm font-medium focus:outline-none w-full md:w-auto cursor-pointer">
                    <option value="overview" class="bg-surface-hover">Visão Geral</option>
                    <option value="week" class="bg-surface-hover">Última Semana</option>
                    <option value="month" class="bg-surface-hover">Último Mês</option>
                </select>
            </div>
        </header>

		<div id="topic-list" class="flex flex-col gap-4">
            
            <% 
 
            List<Answer> answers = (List<Answer>) request.getAttribute("answerList");
            

            if (answers != null && !answers.isEmpty()) {

                for (Answer resp : answers) {
                    
                    
                    String textColor = resp.isGotRight() ? "text-success" : "text-danger";
                    String barColor = resp.isGotRight() ? "bg-success" : "bg-danger";
                    String resultText = resp.isGotRight() ? "Acertou" : "Errou";
            %>
            
            <div class="border border-divider rounded-xl p-4 transition-all hover:shadow-md hover:border-muted">
                <div class="flex justify-between items-center mb-3">
                    <span class="font-semibold text-content">Questão ID: <%= resp.getQuestionId() %></span>
                    <span class="font-bold <%= textColor %>"><%= resultText %></span>
                </div>
                <div class="w-full bg-surface rounded-full h-2.5">
                    <div class="<%= barColor %> h-2.5 rounded-full" style="width: 100%"></div>
                </div>
            </div>

            <% 
                }
            } else { 
            %>
            
                <p class="text-muted text-center mt-5">Nenhuma resposta encontrada para este aluno.</p>
            <% } %>

        </div>

    </main>

</body>
</html>
