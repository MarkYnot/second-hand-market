package cn.second_hand.manager.service;

import org.bson.Document;

import cn.second_hand.manager.dao.ManagerDao;
import cn.second_hand.manager.domain.Manager;
import cn.second_hand.manager.domain.ManagerException;
import cn.second_hand.user.domain.User;
import cn.second_hand.user.domain.UserException;

public class ManagerService {
	
	private ManagerDao dao = new ManagerDao();
	
	public Manager login(Manager manager) throws ManagerException {
		Document d = dao.findByEmail(manager.getEmail());
	    if(d==null) {
			throw new ManagerException("Email address not exists");
		}
		if(!d.getString("password").equals(manager.getPassword())) {
			throw new ManagerException("Password is wrong");
		}
		
	     Manager m = new Manager();
		m.setEmail(d.getString("email"));
		m.setPassword(d.getString("password"));
		m.setName(d.getString("name"));
		
		return m;
	}


}
