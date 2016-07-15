package com.landicorp.moneytree.timer;

import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import com.landicorp.core.entities.User;
import com.landicorp.core.service.IUserService;
import com.landicorp.moneytree.entities.UserExtra;
import com.landicorp.moneytree.service.IUserExtraService;
import com.landicorp.moneytree.util.SpringContextHolder;

public class SendMessageTask extends TimerTask {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		IUserExtraService userExtraService = (IUserExtraService) SpringContextHolder.getBean("userExtraService");
		IUserService userService=(IUserService)SpringContextHolder.getBean("userService");
		List<UserExtra> userExtras=userExtraService.getByFinishTime();
		for(int i=0;i<userExtras.size();i++){
		    if(userExtras.get(i).getFinishTime()!=null){
		        User user=userService.getById(userExtras.get(i).getUser().getId());
	            if(user.getAvailable()==1 && userExtras.get(i).getFinishTime().getTime()<=new Date().getTime()){
	                user.setAvailable(0);
	                userService.update(user);
	            }
		    }
			
			
		}
		
	}

}
