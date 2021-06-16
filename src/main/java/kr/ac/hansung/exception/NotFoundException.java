package kr.ac.hansung.exception;

public class NotFoundException extends RuntimeException {
	
	private static final long serialVersionUID = 8795546082074185666L;
	
	private Long Id;

	private String email;
	
	public NotFoundException(Long Id) {
		this.Id = Id;
	}
	
	public NotFoundException(String email) {
		this.email = email;
	}

	public long getId() {
		return Id;
	}
}