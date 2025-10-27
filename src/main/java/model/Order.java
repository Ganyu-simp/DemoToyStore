/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author shiro
 */
public class Order {
    private int oid;
    private int uid;
    private String customer;
    private String address;
    private String phonenum;
    private String date;

    public Order() {
    }

    public Order(int oid, int uid, String customer, String address, String phonenum, String date) {
        this.oid = oid;
        this.uid = uid;
        this.customer = customer;
        this.address = address;
        this.phonenum = phonenum;
        this.date = date;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "OrderInfo{" + "oid=" + oid + ", uid=" + uid + ", customer=" + customer + ", address=" + address + ", phonenum=" + phonenum + ", date=" + date + '}';
    }
    
}
