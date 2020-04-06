package kr.co.vo;

public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String Keyword = "";
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String SearchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return Keyword;
	}
	public void setKeyword(String Keyword) {
		this.Keyword = Keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", Keyword=" + Keyword + "]";
	}
}
