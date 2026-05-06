<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kairos.model.Answer" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Desempenho - Kairos</title>
    
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>Î£</text></svg>">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=DM+Serif+Text:ital@0;1&display=swap" rel="stylesheet">
    
    <style>
        body { font-family: 'DM Serif Text', serif; }
        .fonte-logo { font-family: 'Archivo Black', sans-serif; }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<body class="bg-[#161F35] flex justify-center min-h-screen p-4 md:p-8">

    <main class="bg-[#1D2B48] w-full max-w-3xl p-6 md:p-8 rounded-2xl shadow-lg h-fit mt-4 md:mt-10">
        
        <header class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4 border-b border-gray-700 pb-5">
            <div>
                <h1 class="text-2xl fonte-logo text-white">Meu Desempenho</h1>
                <p class="text-sm text-gray-400 mt-1">Acompanhe seu percentual de acertos por tópico</p>
            </div>

            <div class="flex items-center gap-2 bg-[#161F35] border border-gray-600 rounded-lg px-3 py-2 w-full md:w-auto">
                
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-[#E16144]" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd" />
                </svg>

                <select class="bg-transparent text-gray-200 text-sm font-medium focus:outline-none w-full md:w-auto cursor-pointer">
                    <option value="geral" class="bg-[#1D2B48]">Visão Geral</option>
                    <option value="semana" class="bg-[#1D2B48]">Última Semana</option>
                    <option value="mês" class="bg-[#1D2B48]">Último Mês</option>
                </select>
            </div>
        </header>

		<div id="lista-topicos" class="flex flex-col gap-4">
            
            <% 
 
            List<Answer> respostas = (List<Answer>) request.getAttribute("listaRespostas");
            

            if (respostas != null && !respostas.isEmpty()) {

                for (Answer resp : respostas) {
                    
                    
                    String corTexto = resp.isGotRight() ? "text-green-400" : "text-[#E16144]";
                    String corBarra = resp.isGotRight() ? "bg-green-500" : "bg-[#E16144]";
                    String textoAcerto = resp.isGotRight() ? "Acertou" : "Errou";
            %>
            
            <div class="border border-gray-700 rounded-xl p-4 transition-all hover:shadow-md hover:border-gray-500">
                <div class="flex justify-between items-center mb-3">
                    <span class="font-semibold text-gray-200">Questão ID: <%= resp.getQuestionId() %></span>
                    <span class="font-bold <%= corTexto %>"><%= textoAcerto %></span>
                </div>
                <div class="w-full bg-[#161F35] rounded-full h-2.5">
                    <div class="<%= corBarra %> h-2.5 rounded-full" style="width: 100%"></div>
                </div>
            </div>

            <% 
                }
            } else { 
            %>
            
                <p class="text-gray-400 text-center mt-5">Nenhuma resposta encontrada para este aluno.</p>
            <% } %>

        </div>

    </main>

</body>
</html>