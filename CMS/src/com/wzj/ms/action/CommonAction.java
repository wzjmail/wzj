
package com.wzj.ms.action;

import com.wzj.ms.service.Service;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

public class CommonAction {
	@Autowired
	  protected Service service;
	  protected Map<String, Object> map = new HashMap();
	  protected Map<String, Object> search = new HashMap();
	  
}
