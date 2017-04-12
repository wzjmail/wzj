package com.wzj.ms.service;

import com.wzj.ms.order.Order;
import com.wzj.ms.pojo.Pages;
import com.wzj.ms.pojo.User;
import java.util.Map;

public abstract interface Service
{
  public abstract User login(User paramUser);

  public abstract boolean insert(Object paramObject);

  public abstract boolean insert(Object paramObject, String paramString);

  public abstract boolean insert(Map<String, Object> paramMap);

  public abstract boolean insert(Map<String, Object> paramMap, String paramString);

  public abstract boolean delete(Object paramObject);

  public abstract boolean delete(Object paramObject, String paramString);

  public abstract boolean delete(Map<String, Object> paramMap);

  public abstract boolean delete(Map<String, Object> paramMap, String paramString);

  public abstract boolean update(Object paramObject);

  public abstract boolean update(Object paramObject, String paramString);

  public abstract boolean update(Map<String, Object> paramMap);

  public abstract boolean update(Map<String, Object> paramMap, String paramString);

  public abstract Map<String, Object> list(Object paramObject, Pages paramPages);

  public abstract Map<String, Object> list(Object paramObject, String paramString, Pages paramPages);

  public abstract Map<String, Object> list(Map<String, Object> paramMap, Pages paramPages);

  public abstract Map<String, Object> list(Map<String, Object> paramMap, String paramString, Pages paramPages);

  public abstract Object find(Object paramObject);

  public abstract Object find(Object paramObject, String paramString);

  public abstract Object find(Map<String, Object> paramMap);
  public abstract Object find(Map<String, Object> paramMap, String paramString);
  
}