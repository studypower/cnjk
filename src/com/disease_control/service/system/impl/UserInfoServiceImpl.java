package com.disease_control.service.system.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.disease_control.entity.mapper.UserInfoMapper;
import com.disease_control.entity.model.UserInfo;
import com.disease_control.service.system.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService{
	
	private UserInfoMapper userInfoMapper;
	
	@Override
	public List<UserInfo> queryAll() {
		return userInfoMapper.selectAll();
	}

	public UserInfoMapper getUserInfoMapper() {
		return userInfoMapper;
	}

	public void setUserInfoMapper(UserInfoMapper userInfoMapper) {
		this.userInfoMapper = userInfoMapper;
	}

	
}
