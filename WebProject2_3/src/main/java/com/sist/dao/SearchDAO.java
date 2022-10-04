package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.vo.*;
import java.util.*;

@Repository
public class SearchDAO extends SqlSessionDaoSupport {
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
    //<select id="integratedSearch" resultType="BookVO" parameterType="hashmap">
	public List<BookVO> integratedSearch(Map map){
		return getSqlSession().selectList("integratedSearch",map);
	}
	
	public int findDataCount(Map map) {
		return getSqlSession().selectOne("findDataCount", map);
	}

	
}
