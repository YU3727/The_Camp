package com.camp.s1.camping;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.util.Pager;

@Repository
public class CampDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.camp.s1.camping.CampDAO.";
	
	//totalCount
	public Long getTotalCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	//list
	public List<CampDTO> getCampList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCampList", pager);
	}
	
	//detail
	public CampDTO getCampDetail(CampDTO campDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCampDetail", campDTO);
	}
	
	//delete
	public int setCampDelete(CampDTO campDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCampDelete", campDTO);
	}
	
	//add
	public int setCampAdd(CampDTO campDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampAdd", campDTO);
	}
		
	//update
	public int setCampUpdate(CampDTO campDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setCampUpdate", campDTO);
	}
	
	//file
	//fileList
	public List<CampFileDTO> getCampFileList(CampDTO campDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCampFileList", campDTO);
	}
	
	//fileAdd
	public int setCampFileAdd(CampFileDTO campFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampFileAdd", campFileDTO);
	}
	
	//fileDetail
	public CampFileDTO getCampFileDetail(CampFileDTO campFileDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCampFileDetail", campFileDTO);
	}
	
	//fileDelete
	public int setCampFileDelete(Long fileNum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCampFileDelete", fileNum);
	}
	
	//site(option) - 디테일에서 캠프사이트를 가져올 것
	public List<CampSiteDTO> getCampSiteList(CampDTO campDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCampSiteList", campDTO);
	}
	
	//siteAdd
	public int setCampSiteAdd(CampSiteDTO campSiteDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampSiteAdd", campSiteDTO);
	}
	
	//siteDelete
	public int setCampSiteDelete(Long areaNum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCampSiteDelete", areaNum);
	}
	
	//thumbnail - list가 없고 이미지 파일 한개임
	public ThumbnailDTO getThumbnailDetail(CampDTO campDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getThumbnailDetail", campDTO);
	}
	
	//thumbnailAdd
	public int setThumbnailAdd(ThumbnailDTO thumbnailDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setThumbnailAdd", thumbnailDTO);
	}
	
	//thumbnailDelete
	public int setThumbnailDelete(Long thumbNum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setThumbnailDelete", thumbNum);
	}
	
	//layout
	public LayoutDTO getLayoutDetail(CampDTO campDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getLayoutDetail", campDTO);
	}
	
	//layoutAdd
	public int setLayoutAdd(LayoutDTO layoutDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setLayoutAdd", layoutDTO);
	}
	
	//layoutDelete
	public int setLayoutDelete(Long layoutNum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setLayoutDelete", layoutNum);
	}
	
	//
	public List<CampDTO> getSigunguNameList(CampDTO campDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getSigunguNameList", campDTO);
	}
	
	public List<CampDTO> getSearchCampList(CampDTO campDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getSearchCampList", campDTO);
	}
	
}
