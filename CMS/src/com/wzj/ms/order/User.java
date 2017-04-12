package com.wzj.ms.order;

public class User extends Common
{
  private String image;
private int newNum;
private int newNumB;
private int num;
private int numAll;
private int number;
private String password;
private int role;
private String session;
private int price;
public int getPrice() {
	return price;
}


public void setPrice(int price) {
	this.price = price;
}

  public String getImage() {
    return this.image;
  }
public int getNewNum()
  {
    return this.newNum;
  }
public int getNewNumB() {
    return this.newNumB;
  }
public int getNum() {
    return this.num;
  }
public int getNumAll() {
    return this.numAll;
  }
public int getNumber() {
    return this.number;
  }
public String getPassword() {
    return this.password;
  }
public int getRole() {
    return this.role;
  }
public String getSession() {
    return this.session;
  }
public void setImage(String image) {
    this.image = image;
  }
public void setNewNum(int newNum) {
    this.newNum = newNum;
  }
public void setNewNumB(int newNumB) {
    this.newNumB = newNumB;
  }
public void setNum(int num) {
    this.num = num;
  }
public void setNumAll(int numAll) {
    this.numAll = numAll;
  }
public void setNumber(int number) {
    this.number = number;
  }
public void setPassword(String password) {
    this.password = password;
  }
public void setRole(int role) {
    this.role = role;
  }
public void setSession(String session) {
    this.session = session;
  }
public String toString() {
    return "User [session=" + this.session + ", password=" + this.password + ", role=" + this.role + 
      ", getSign()=" + getSign() + "]";
  }
}