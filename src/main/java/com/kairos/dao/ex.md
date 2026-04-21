# exemplo
package com.meusistema.dao;

import com.meusistema.model.Produto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {

    // ── Listar todos os produtos ──────────────────────────────────────────
    public List<Produto> listarTodos() throws SQLException {
        List<Produto> lista = new ArrayList<>();
        String sql = "SELECT * FROM produtos ORDER BY nome";

        // try-with-resources: fecha a conexão automaticamente ao sair do bloco
        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setPreco(rs.getDouble("preco"));
                p.setEstoque(rs.getInt("estoque"));
                lista.add(p);
            }
        }
        return lista;
    }

    // ── Buscar por ID ─────────────────────────────────────────────────────
    public Produto buscarPorId(int id) throws SQLException {
        String sql = "SELECT * FROM produtos WHERE id = ?";

        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);  // O "?" vira o id — previne SQL Injection!
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Produto p = new Produto();
                    p.setId(rs.getInt("id"));
                    p.setNome(rs.getString("nome"));
                    p.setPreco(rs.getDouble("preco"));
                    p.setEstoque(rs.getInt("estoque"));
                    return p;
                }
            }
        }
        return null;
    }

    // ── Inserir ───────────────────────────────────────────────────────────
    public void inserir(Produto produto) throws SQLException {
        String sql = "INSERT INTO produtos (nome, preco, estoque) VALUES (?, ?, ?)";

        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, produto.getNome());
            ps.setDouble(2, produto.getPreco());
            ps.setInt(3, produto.getEstoque());
            ps.executeUpdate();
        }
    }

    // ── Atualizar ─────────────────────────────────────────────────────────
    public void atualizar(Produto produto) throws SQLException {
        String sql = "UPDATE produtos SET nome=?, preco=?, estoque=? WHERE id=?";

        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, produto.getNome());
            ps.setDouble(2, produto.getPreco());
            ps.setInt(3, produto.getEstoque());
            ps.setInt(4, produto.getId());
            ps.executeUpdate();
        }
    }

    // ── Excluir ───────────────────────────────────────────────────────────
    public void excluir(int id) throws SQLException {
        String sql = "DELETE FROM produtos WHERE id=?";

        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}