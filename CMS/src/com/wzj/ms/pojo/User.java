package com.wzj.ms.pojo;

public class User extends Common
{
  private String session;
  private String password;
  private int role;
  private int num;
  private int numAll;
  private int number;
  private int newNum;
  private int newNumB;
  private String image;
  private int price;
  private int storage;
  public int getStorage() {
	return storage;
}


public void setStorage(int storage) {     
	this.storage = storage;
}


public int getPrice() {
	return price;
}


public void setPrice(int price) {
	this.price = price;
}
  public int getNewNum()
  {
    return this.newNum;
  }
  public void setNewNum(int newNum) {
    this.newNum = newNum;
  }
  public int getNewNumB() {
    return this.newNumB;
  }
  public void setNewNumB(int newNumB) {
    this.newNumB = newNumB;
  }
  public int getNumber() {
    return this.number;
  }
  public void setNumber(int number) {
    this.number = number;
  }
  public int getNumAll() {
    return this.numAll;
  }
  public void setNumAll(int numAll) {
    this.numAll = numAll;
  }
  public int getNum() {
    return this.num;
  }
  public void setNum(int num) {
    this.num = num;
  }
  public String getSession() {
    return this.session;
  }
  public void setSession(String session) {
    this.session = session;
  }
  public String getPassword() {
    return this.password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public int getRole() {
    return this.role;
  }
  public void setRole(int role) {
    this.role = role;
  }
  public String getImage() {
    return this.image;
  }
  public void setImage(String image) {
    this.image = image;
  }

  public String toString() {
    return "User [session=" + this.session + ", password=" + this.password + ", role=" + this.role + 
      ", getSign()=" + getSign() + "]";
  }
}