package kr.co.service;

import javax.inject.Inject;

import kr.co.dao.MemberDAO;
import kr.co.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	//Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받고
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		//받은 vo를 DAO로 보내줍니다
		dao.memberUpdate(vo);
	}
	
	//업데이트에서 처리한내용과 똑같음
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}
	
	//패스워드 체크
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}
	
	//아이디중복 체크
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
}
