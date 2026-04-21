# exemplo 

package com.meusistema.controller;

import com.meusistema.dao.ProdutoDAO;
import com.meusistema.model.Produto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

// @WebServlet mapeia a URL /produtos para este Servlet
// Você pode eliminar o web.xml com esta anotação!
@WebServlet("/produtos")
public class ProdutoServlet extends HttpServlet {

    private final ProdutoDAO dao = new ProdutoDAO();

    // ── GET: exibir lista ou formulário ───────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // req.getParameter() lê parâmetros da URL: /produtos?acao=novo
        String acao = req.getParameter("acao");

        try {
            if ("novo".equals(acao)) {
                // Mostrar formulário em branco
                req.getRequestDispatcher("/views/form-produto.jsp").forward(req, resp);

            } else if ("editar".equals(acao)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Produto produto = dao.buscarPorId(id);
                // setAttribute coloca dados que o JSP vai ler
                req.setAttribute("produto", produto);
                req.getRequestDispatcher("/views/form-produto.jsp").forward(req, resp);

            } else if ("excluir".equals(acao)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.excluir(id);
                // sendRedirect evita resubmissão ao atualizar a página (POST/Redirect/GET)
                resp.sendRedirect(req.getContextPath() + "/produtos");

            } else {
                // Listagem padrão
                List<Produto> lista = dao.listarTodos();
                req.setAttribute("produtos", lista);  // JSP lê com ${produtos}
                req.getRequestDispatcher("/views/produtos.jsp").forward(req, resp);
            }

        } catch (SQLException e) {
            throw new ServletException("Erro no banco de dados", e);
        }
    }

    // ── POST: salvar dados do formulário ──────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");  // Importante para acentos!

        String idParam = req.getParameter("id");
        String nome    = req.getParameter("nome");
        double preco   = Double.parseDouble(req.getParameter("preco"));
        int estoque    = Integer.parseInt(req.getParameter("estoque"));

        try {
            if (idParam == null || idParam.isEmpty()) {
                // Novo produto
                dao.inserir(new Produto(nome, preco, estoque));
            } else {
                // Edição
                Produto p = new Produto(nome, preco, estoque);
                p.setId(Integer.parseInt(idParam));
                dao.atualizar(p);
            }
            // Redirecionar para a lista (padrão PRG: Post/Redirect/Get)
            resp.sendRedirect(req.getContextPath() + "/produtos");

        } catch (SQLException e) {
            throw new ServletException("Erro ao salvar produto", e);
        }
    }
}