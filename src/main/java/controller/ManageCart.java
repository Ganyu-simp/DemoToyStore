/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author shiro
 */
public class ManageCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        List<Category> listC = new CategoryDAO().getAll();

        if (a == null) {
            // Chưa đăng nhập
            response.sendRedirect("login.jsp");
        }
        String cart = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("cart")) {
                    cart = c.getValue();
                }
            }
        }

        // Tách product IDs
        Map<Integer, Integer> productQuantityMap = new HashMap<>();
        if (cart != null && !cart.trim().isEmpty()) {
            String[] pidList = cart.split("-");
            for (String pidStr : pidList) {
                try {
                    int pid = Integer.parseInt(pidStr);
                    productQuantityMap.put(pid, productQuantityMap.getOrDefault(pid, 0) + 1);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
        }

        // Lấy danh sách sản phẩm từ DB
        ProductDAO productDAO = new ProductDAO();
        List<Product> productList = new ArrayList<>();
        for (int pid : productQuantityMap.keySet()) {
            productList.add(new ProductDAO().getProductByID(Integer.toString(pid)));
        }
        // Gắn thêm số lượng vào từng sản phẩm
        for (Product p : productList) {
            int quantity = productQuantityMap.get(p.getId());
            p.setQuantity(quantity); // Đảm bảo model Product có thuộc tính quantity
        }

        request.setAttribute("list", productList);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
