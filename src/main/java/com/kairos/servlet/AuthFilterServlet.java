package com.kairos.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Set;

@WebFilter("/*")
public class AuthFilterServlet implements Filter {

    private static final Set<String> PUBLIC_PATHS = Set.of(
            "/login",
            "/register",
            "/logout",
            "/new-password",
            "/termos",
            "/favicon.png",
            "/favicon.ico"
    );

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String path = req.getRequestURI().substring(req.getContextPath().length());

        boolean isPublic = PUBLIC_PATHS.contains(path)
                || path.startsWith("/css/")
                || path.startsWith("/js/")
                || path.startsWith("/icons/")
                || path.startsWith("/termos")
                || path.startsWith("/images/");

        HttpSession session = req.getSession(false);
        boolean logged = (session != null && session.getAttribute("user") != null);

        if (isPublic || logged) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
