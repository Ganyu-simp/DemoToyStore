/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Product;

/**
 *
 * @author shiro
 */
public class AccountDAO {

    PreparedStatement st = null;
    ResultSet rs = null;
    Connection con = new DBContext().getConnection();

    public Account login(String user, String pass) {
        String query = "SELECT * FROM Account \n"
                + "WHERE [user] = ?\n"
                + "and [pass] = ?";
        try {
            st = con.prepareStatement(query);
            st.setString(1, user);
            st.setString(2, pass);
            rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean checkAccountExist(String user) {
        String query = "SELECT * FROM Account \n"
                + "WHERE [user] = ?";
        try {
            st = con.prepareStatement(query);
            st.setString(1, user);
            rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    public void addAccount(String user, String pass) {
        String query = "INSERT INTO Account\n"
                + "VALUES (?,?,0,0)";
        try {
            st = con.prepareStatement(query);
            st.setString(1, user);
            st.setString(2, pass);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
     public void deleteAccount(int uid) {
        String sql = "DELETE FROM Account WHERE uid = ?";
        try (PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật thông tin tài khoản
    public void updateAccount(int uid, String username, String password, boolean isSeller, boolean isAdmin) {
        String sql = "UPDATE Account SET username = ?, password = ?, isSeller = ?, isAdmin = ? WHERE uid = ?";
        try (PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, password);
            st.setBoolean(3, isSeller);
            st.setBoolean(4, isAdmin);
            st.setInt(5, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy toàn bộ tài khoản (hiển thị listA)
    public List<Account> getAllAccounts() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account";
        try (PreparedStatement st = con.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Account a = new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getBoolean(4),rs.getBoolean(5));
                list.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Account getAccountByID(int uid) {
    String query = "SELECT * FROM Account WHERE uid = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
         
        ps.setInt(1, uid);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            return new Account(
                rs.getInt("uid"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getBoolean("isSeller"),
                rs.getBoolean("isAdmin")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}



}
