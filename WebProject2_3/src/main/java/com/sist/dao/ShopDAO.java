package com.sist.dao;

import java.util.*;

import com.sist.mapper.ShopMapper;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDAO {
	@Autowired
	private ShopMapper mapper;
	
	public List<ShopVO> shopListData(Map map){
		return mapper.shopListData(map);
	}
	public int shopTotalCount(Map map) {
		return mapper.shopTotalCount(map);
	}
	public ShopVO shopDetailData(int no) {
		return mapper.shopDetailData(no);
	}
	public List<ShopVO> shopListData_pub(Map map){
		return mapper.shopListData_pub(map);
	}
	public int shopTotalCount_pub(Map map) {
		return mapper.shopTotalCount_pub(map);
	}
	public void purchase(int no) {
		mapper.purchase(no);
	}
}
