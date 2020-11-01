package cn.second_hand.user.service;

import java.util.List;

import org.bson.Document;

import cn.second_hand.user.dao.UserDao;
import cn.second_hand.user.domain.User;
import cn.second_hand.user.domain.UserException;

public class UserService {
	private UserDao dao = new UserDao();

	public void active(String code) throws UserException {
		Document d = dao.findByVerifyCode(code);
		if (d == null) {
			throw new UserException("Incorrect verify code!");
		}
		if (d.getBoolean("activeStatus").equals(true)) {
			throw new UserException("You already actived account, please do not try again!");
		}
		dao.updateActiveState(code, true);
	}

	public void register(User user) throws UserException {
		if (dao.findByEmail(user.getEmail()) != null) {
			throw new UserException("Email address already exists");
		}
		dao.register(user);
	}

	public User login(User user) throws UserException {
		Document d = dao.findByEmail(user.getEmail());
		if (d == null) {
			throw new UserException("Email address not exists");
		}
		if (!d.getString("password").equals(user.getPassword())) {
			throw new UserException("Password is wrong");
		}
		if (!d.getBoolean("activeStatus")) {
			throw new UserException("Sorry, you account is not actived please active first");
		}
		User u = new User();
		u.setEmail(d.getString("email"));
		u.setPassword(d.getString("password"));
		return u;
	}

	public void forgotPassword(String userEmail, String resetCode) throws UserException {
		Document d = dao.findByEmail(userEmail);
		if (d == null) {
			throw new UserException("Email address not exists");
		}
		dao.forgotPassword(userEmail,resetCode);
	}

	public void findByPasswordResetCode(String code) throws UserException {
		Document d = dao.findByPasswordResetCode(code);
		if (d == null) {
			throw new UserException("Incorrect password reset code!");
		}
	}

	public void resetPassword(String code, String password) throws UserException {
		Document d = dao.findByPasswordResetCode(code);
		if (d == null) {
			throw new UserException("Invalid verification code, please return to forgot password page to get reset email again");
		}
		dao.resetPassword(code,password);
	}

	public void topupBalance(User currentUser) {
		dao.updateBalance(currentUser.getEmail(), currentUser.getBalance());
	}
	
	public List<User> findAll() {
		
		return dao.findAll();	
		}


}
