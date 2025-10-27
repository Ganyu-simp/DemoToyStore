/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dao.DBContext;
import dao.DBContext;
import dao.DBContext;
import java.sql.*;
import java.util.*;

import model.Product;

/**
 *
 * @author shiro
 */
public class ProductDAO {

    Connection con = new DBContext().getConnection();

    PreparedStatement st = null;

    ResultSet rs = null;

    public List<Product> getAll() {
        String query = "SELECT * FROM Product";
        List<Product> list = new ArrayList<>();
        try {

            st = con.prepareStatement(query);
            rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8),rs.getInt(9));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLast() {
        String query = "SELECT TOP 1 * FROM Product\n ORDER BY id DESC";

        try {

            st = con.prepareStatement(query);
            rs = st.executeQuery();

            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8),rs.getInt(9));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductByCateID(String cid) {
        String query = "SELECT * FROM Product\n"
                + "WHERE categoryID = ? ";
        List<Product> categorized = new ArrayList<>();
        try {
            st = con.prepareStatement(query);
            //thay dau hoi dau tien thanh cid
            st.setString(1, cid);
            rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8),rs.getInt(9));
                categorized.add(p);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return categorized;
    }

    public Product getProductByID(String id) {
        String query = "SELECT * FROM  Product \n"
                + "WHERE id = ? ";

        try {
            st = con.prepareStatement(query);
            st.setString(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8),rs.getInt(9));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Product> searchProductByName(String name) {
        String query = "SELECT * FROM Product \n"
                + "WHERE [name] LIKE ?";
        List<Product> foundList = new ArrayList<>();
        try {
            st = con.prepareStatement(query);
            st.setString(1, "%" + name + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                foundList.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8),rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return foundList;
    }

    public List<Product> getProductBySeller(int uID) {
        String query = "SELECT * FROM  Product \n"
                + "WHERE sellID = ? ";
        List<Product> sellerList = new ArrayList<>();
        try {
            st = con.prepareStatement(query);
            st.setInt(1, uID);
            rs = st.executeQuery();
            while (rs.next()) {
                sellerList.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8),rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return sellerList;
    }

    public void addProduct(String name, String image, String price, String tittle, String description, String category, String uid, int quantity) {
        String query = "INSERT INTO [dbo].[Product]\n"
                + "(name, image, price, title, description, categoryID, sellID, quantity)"
                + "VALUES(?, ?, ?, ?, ?, ?, ?,?)";
        try {
            st = con.prepareStatement(query);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, tittle);
            st.setString(5, description);
            st.setString(6, category);
            st.setString(7, uid);
            st.setInt(8,quantity);
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteProduct(String id) {
        String query = "DELETE FROM  Product \n"
                + "WHERE id = ? ";
        try {
            st = con.prepareStatement(query);
            st.setString(1, id);
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateProduct(String pid, String name, String image, String price, String tittle, String description, String category, String uid, String quantity) {
        String query = "UPDATE Product\n"
                + "SET name = ?, image = ?, price = ?, title = ?, description = ?, categoryID = ?, sellID = ?, quantity = ?\n"
                + "WHERE id = ?";
        try {
            st = con.prepareStatement(query);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, tittle);
            st.setString(5, description);
            st.setString(6, category);
            st.setString(7, uid);
            st.setString(8, quantity);
            st.setString(9, pid);
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    public static void main(String[] args) {
      new ProductDAO().addProduct("bapcai", "https://th.bing.com/th/id/OIP.GjDNsYPxy0vy4FvDHtZlZQHaEI?w=281&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3", "12", "Bap cai xanh la cay", "nhua an toan cho be", "5", "1",45);  
    }


}
