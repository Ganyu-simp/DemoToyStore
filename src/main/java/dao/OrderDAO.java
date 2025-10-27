package dao;

import java.sql.*;
import java.util.*;
import model.Order;
import model.OrderDetails;

public class OrderDAO {

    Connection con = new DBContext().getConnection();

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOid(rs.getInt("oid"));
                o.setUid(rs.getInt("uid"));
                o.setCustomer(rs.getString("customer"));
                o.setAddress(rs.getString("address"));
                o.setPhonenum(rs.getString("phonenum"));
                o.setDate(rs.getString("orderDate"));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<OrderDetails> getAllOrderDetails() {
        List<OrderDetails> list = new ArrayList<>();
        String sql = "SELECT id, oid, pid, name, quantity, price FROM OrderDetails ";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetails od = new OrderDetails();
                od.setId(rs.getInt("id"));
                od.setOid(rs.getInt("oid"));
                od.setPid(rs.getInt("pid"));
                od.setPname(rs.getString("name"));     // Cột name trong DB là tên sản phẩm
                od.setQuantity(rs.getInt("quantity"));
                od.setPrice(rs.getDouble("price"));
                list.add(od);
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int addOrder(int uid, String customer, String address, String phonenum) {
        int oid = 0;
        String query = "INSERT INTO Orders (uid, customer, address, phonenum, orderDate) VALUES (?, ?, ?, ?, GETDATE())";

        try (PreparedStatement st = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            st.setInt(1, uid);
            st.setString(2, customer);
            st.setString(3, address);
            st.setString(4, phonenum);

            int rows = st.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = st.getGeneratedKeys()) {
                    if (rs.next()) {
                        oid = rs.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error in addOrder: " + e.getMessage());
        }
        return oid;
    }

    public void deleteOrder(int oid) {
        String deleteDetailsSQL = "DELETE FROM OrderDetails WHERE oid = ?";
        String deleteOrderSQL = "DELETE FROM Orders WHERE oid = ?";

        try {
            con.setAutoCommit(false);

            try (PreparedStatement st1 = con.prepareStatement(deleteDetailsSQL); PreparedStatement st2 = con.prepareStatement(deleteOrderSQL)) {

                st1.setInt(1, oid);
                st1.executeUpdate();

                st2.setInt(1, oid);
                st2.executeUpdate();

                con.commit();
            } catch (SQLException e) {
                con.rollback();
                System.out.println("Rollback due to error in deleteOrder: " + e.getMessage());
            } finally {
                con.setAutoCommit(true);
            }
        } catch (SQLException e) {
            System.out.println("Error in deleteOrder: " + e.getMessage());
        }
    }

    public void addOrderDetails(String cart, int oid) {
        if (oid <= 0) {
            System.out.println("Invalid order ID. Cannot add order details.");
            return;
        }

        String[] pidlist = cart.split("-");
        Map<Integer, Integer> productQuantityMap = new HashMap<>();

        for (String idStr : pidlist) {
            try {
                int pid = Integer.parseInt(idStr);
                productQuantityMap.put(pid, productQuantityMap.getOrDefault(pid, 0) + 1);
            } catch (NumberFormatException e) {
                System.out.println("Invalid product ID: " + idStr);
            }
        }

        if (productQuantityMap.isEmpty()) {
            System.out.println("No valid products found in cart.");
            return;
        }

        StringBuilder queryBuilder = new StringBuilder("SELECT id, name, price FROM Product WHERE id IN (");
        queryBuilder.append("?,".repeat(productQuantityMap.size()));
        queryBuilder.setLength(queryBuilder.length() - 1);
        queryBuilder.append(")");

        try (PreparedStatement st = con.prepareStatement(queryBuilder.toString())) {
            int index = 1;
            for (Integer pid : productQuantityMap.keySet()) {
                st.setInt(index++, pid);
            }

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int pid = rs.getInt("id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = productQuantityMap.get(pid);

                    String insertQuery = "INSERT INTO OrderDetails (oid, pid, name, quantity, price) VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement insertSt = con.prepareStatement(insertQuery)) {
                        insertSt.setInt(1, oid);
                        insertSt.setInt(2, pid);
                        insertSt.setString(3, name);
                        insertSt.setInt(4, quantity);
                        insertSt.setDouble(5, price);
                        insertSt.executeUpdate();
                    }
                    // Trừ số lượng trong bảng Product
                    String updateQuantityQuery = "UPDATE Product SET quantity = quantity - ? WHERE id = ?";
                    try (PreparedStatement updateSt = con.prepareStatement(updateQuantityQuery)) {
                        updateSt.setInt(1, quantity);
                        updateSt.setInt(2, pid);
                        updateSt.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error while adding order details: " + e.getMessage());
        }
    }

    public List<OrderDetails> getOrderDetailsByOid(int oid) {
        List<OrderDetails> list = new ArrayList<>();
        String sql = "SELECT id, oid, pid, name, quantity, price FROM OrderDetails WHERE oid = ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetails od = new OrderDetails();
                od.setId(rs.getInt("id"));
                od.setOid(rs.getInt("oid"));
                od.setPid(rs.getInt("pid"));
                od.setPname(rs.getString("name"));     // Cột name trong DB là tên sản phẩm
                od.setQuantity(rs.getInt("quantity"));
                od.setPrice(rs.getDouble("price"));
                list.add(od);
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
