package july28.board.model;

public class WritingRequest {
	private String writerName;
	private String password;
	private String title;
	private String content;
	
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Article toArticle() { 
		Article article = new Article(); /* Article타입 article객체를 생성 */
		article.setWriterName(writerName); /* article의 메서드로 값을 설정하여 Article객체를 리턴 */
		article.setPassword(password);
		article.setTitle(title);
		article.setContent(content);
		return article;
	}
}
