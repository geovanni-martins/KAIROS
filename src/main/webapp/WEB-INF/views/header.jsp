<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String uri = request.getRequestURI();
    boolean isLogin    = uri.contains("login");
    boolean isRegister = uri.contains("register") || uri.contains("cadastro");
%>

<header class="sticky top-0 z-50 w-full flex items-center justify-between px-5 h-[62px] border-b border-white/[0.07]"
        style="background: var(--color-fundo-card); font-family: 'Sora', sans-serif;">

    <%-- Logo --%>
    <a href="${pageContext.request.contextPath}/login"
       class="flex items-center gap-[9px] no-underline shrink-0">

        <div class="w-7 h-7 min-w-[28px] flex items-center justify-center rounded-[7px] text-[13px] font-bold"
             style="
                background: rgba(225,97,68,.15);
                border: 1px solid rgba(225,97,68,.25);
                font-family: 'JetBrains Mono', monospace;
                color: var(--color-marca-kairos);">
            &#x3A3;
        </div>

        <span class="text-base font-medium tracking-[0.18em] whitespace-nowrap max-[400px]:hidden"
              style="
                font-family: 'JetBrains Mono', monospace;
                color: var(--color-marca-kairos);">
            KAIROS
        </span>
    </a>

    <%-- Nav --%>
    <nav class="flex items-center gap-1 shrink-0">

        <a href="${pageContext.request.contextPath}/sobre"
           class="text-[13px] font-normal no-underline px-3 py-[7px] rounded-lg
                  border border-transparent whitespace-nowrap transition-all duration-150
                  hover:border-white/[0.08]"
           style="color: var(--color-texto-opaco);"
           onmouseover="this.style.background='var(--color-fundo-hover)'; this.style.color='var(--color-texto-padrao)';"
           onmouseout="this.style.background=''; this.style.color='var(--color-texto-opaco)';">
            Sobre nós
        </a>

        <div class="w-px h-5 mx-1 bg-white/[0.08] max-[400px]:hidden"></div>

        <a href="${pageContext.request.contextPath}/login"
           class="text-[13px] font-medium no-underline px-[14px] py-[7px] rounded-lg whitespace-nowrap
                  transition-all duration-150 border"
           style="<%= isLogin
               ? "background: rgba(225,97,68,.12); border-color: rgba(225,97,68,.35); color: var(--color-marca-kairos);"
               : "background: var(--color-fundo-hover); border-color: rgba(255,255,255,.10); color: var(--color-texto-padrao);" %>">
            Entrar
        </a>

        <a href="${pageContext.request.contextPath}/register"
           class="text-[13px] font-semibold no-underline px-[14px] py-[7px] rounded-lg whitespace-nowrap
                  transition-all duration-150 border text-white"
           style="<%= isRegister
               ? "background: var(--color-marca-escuro); border-color: var(--color-marca-escuro);"
               : "background: var(--color-marca-kairos); border-color: var(--color-marca-kairos);" %>">
            Criar conta
        </a>

    </nav>
</header>