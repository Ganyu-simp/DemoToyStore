/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author shiro
 */
public class CategoryDAO {
       Connection con = new DBContext().getConnection();

    List<Category> list = new ArrayList<>();

    public List<Category> getAll() {
        String query = "SELECT * FROM Category";
        try {

            PreparedStatement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Category c = new Category(rs.getInt(1),rs.getString(2));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
