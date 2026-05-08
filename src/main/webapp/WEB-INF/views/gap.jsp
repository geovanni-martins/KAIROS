<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kairos.model.Gap" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lacunas - Kairos</title>
    
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>Σ</text></svg>">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=DM+Serif+Text:ital@0;1&display=swap" rel="stylesheet">
    
    <style>
        body { font-family: 'DM Serif Text', serif; }
        .fonte-logo { font-family: 'Archivo Black', sans-serif; }
        .fonte-ui { font-family: system-ui, -apple-system, sans-serif; }
    </style>
    
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<body class="bg-[#161F35] flex justify-center min-h-screen p-4 md:p-8">
	<jsp:include page="/WEB-INF/views/nav.jsp" />	

    <main class="bg-[#1D2B48] w-full max-w-3xl p-6 md:p-8 rounded-2xl shadow-lg h-fit mt-4 md:mt-10">
        
        <header class="mb-6">
            <h1 class="text-3xl font-bold text-white mb-2">Lacunas de Aprendizado</h1>
            <p class="text-gray-400 text-sm">Identificamos pontos de atenção baseados no seu desempenho recente.</p>
        </header>

        <div class="flex flex-wrap gap-3 mb-8 border-b border-gray-700 pb-6 fonte-ui text-sm">
            <button class="bg-[#E16144] text-white px-5 py-2 rounded-full font-semibold transition-transform hover:scale-105 cursor-pointer">
                Todos
            </button>
            
            <button class="bg-[#161F35] border border-gray-600 text-gray-300 px-4 py-2 rounded-full font-medium flex items-center gap-2 hover:bg-gray-800 transition-colors cursor-pointer">
                <div class="w-2 h-2 rounded-full bg-blue-500"></div> Novas
            </button>
            
            <button class="bg-[#161F35] border border-gray-600 text-gray-300 px-4 py-2 rounded-full font-medium flex items-center gap-2 hover:bg-gray-800 transition-colors cursor-pointer">
                <div class="w-2 h-2 rounded-full bg-yellow-500"></div> Em revisão
            </button>
        </div>

        <div class="flex flex-col gap-5">
            
            <% 
            List<Gap> lacunas = (List<Gap>) request.getAttribute("listaLacunas");
            
            if (lacunas != null && !lacunas.isEmpty()) {
                for (Gap lacuna : lacunas) {
                    
                    int total = lacuna.getQtySolvedQuestions();
                    int corretas = lacuna.getCorrectAnswers();
                    int porcentagem = (total == 0) ? 0 : (corretas * 100) / total;
                    
                    String corBorda, corBg, corTexto, labelStatus;
                    
                    if ("SOLVED".equalsIgnoreCase(lacuna.getStats())) {
                        corBorda = "bg-green-500";
                        corBg = "bg-green-500/20";
                        corTexto = "text-green-400";
                        labelStatus = "RESOLVIDA";
                    } else if (porcentagem < 50) {
                        corBorda = "bg-[#E16144]";
                        corBg = "bg-[#E16144]/20";
                        corTexto = "text-[#E16144]";
                        labelStatus = "NOVA";
                    } else {
                        corBorda = "bg-yellow-500";
                        corBg = "bg-yellow-500/20";
                        corTexto = "text-yellow-500";
                        labelStatus = "EM REVISÃO";
                    }
            %>

            <div class="bg-[#161F35] border border-gray-700 rounded-xl p-5 relative overflow-hidden transition-all hover:border-gray-500 <%= "SOLVED".equalsIgnoreCase(lacuna.getStats()) ? "opacity-75" : "" %>">
                <div class="absolute left-0 top-0 bottom-0 w-1.5 <%= corBorda %>"></div>
                
                <div class="fonte-ui inline-flex items-center gap-1.5 <%= corBg %> <%= corTexto %> px-2.5 py-1 rounded-full text-xs font-bold mb-3 uppercase tracking-wider">
                    <div class="w-1.5 h-1.5 rounded-full <%= corBorda %>"></div> <%= labelStatus %>
                </div>
                
                <div class="text-xs text-gray-400 fonte-ui font-medium mb-1 flex items-center gap-2">
                    <span class="<%= "SOLVED".equalsIgnoreCase(lacuna.getStats()) ? "text-gray-500" : "text-[#E16144]" %>"><%= lacuna.getSubject() %></span>
                    <span>›</span>
                    <span><%= lacuna.getTopicName() %></span>
                </div>
                
                <h3 class="text-xl font-bold <%= "SOLVED".equalsIgnoreCase(lacuna.getStats()) ? "text-gray-300 line-through" : "text-white" %> mb-4">
                    Revisão de <%= lacuna.getTopicName() %>
                </h3>
                
                <div class="flex flex-wrap items-center gap-4 text-sm fonte-ui border-t border-gray-700 pt-3">
                    <div class="flex items-center gap-1.5">
                        <span class="text-gray-400">Acertos:</span>
                        <span class="<%= corTexto %> font-bold"><%= porcentagem %>%</span>
                    </div>
                    <div class="flex items-center gap-1.5">
                        <span class="text-gray-400">Questões respondidas:</span>
                        <span class="text-white font-bold"><%= total %></span>
                    </div>
                </div>
            </div>

            <% 
                }
            } else { 
            %>
                <div class="bg-[#161F35] border border-gray-700 rounded-xl p-8 text-center">
                    <p class="text-gray-400">Nenhuma lacuna de aprendizado identificada até o momento. Parabéns!</p>
                </div>
            <% } %>

        </div>

    </main>

</body>
</html>