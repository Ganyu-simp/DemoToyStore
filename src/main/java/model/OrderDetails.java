/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author shiro
 */
public class OrderDetails {
    private int id;
    private int oid;
    private int pid;
    private String pname;
    private int quantity;
    private double price;

    public OrderDetails() {
    }

    public OrderDetails(int id, int oid, int pid, String name, int quantity, double price) {
        this.id = id;
        this.oid = oid;
        this.pid = pid;
        this.pname = name;
        this.quantity = quantity;
        this.price = price;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String name) {
        this.pname = name;
    }
    
    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "id=" + id + ", oid=" + oid + ", pid=" + pid + ", price=" + price + '}';
    }
}
