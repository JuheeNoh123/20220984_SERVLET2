package dto;
import java.io.Serializable; // 직렬화 클래스 연동

public class Product implements Serializable { // 인터페이스 선언

	private static final long serialVersionUID = -4274700572038677000L;    // 고유식별자 : 직렬화 과정에서 식별자로 구분  (직접 지정 안해도 고유 아이디가 생성돼서 비교함)

	private String productId;	//상품 아이디
	private String pname;		//상품명
	private Integer unitPrice; //상품 가격
	private String description; //상품 설명
	private String manufacturer;//제조사
	private String category; 	//분류
	private long unitsInStock; //재고수 
	private String condition; 	//신상품 or 중고품 or 재생품
    private String filename;    //파일 이름 변수
    private int quantity;	//장바구니에 담은 개수
    
    public Product() {
            super();
    }
    
    //set get 함수 설정 : 없으면 접근 불가 ! private한 멤버 변수들한테 접근 불가하므로
    //set get 함수로 접근해야한다.
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public String getPname() {
		return pname;
	}
    
    public void setPname(String pname) {
		this.pname = pname;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

    public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
    
    public  void setFilename(String filename) { // 파일 이름 설정
	this.filename = filename;
    }

    public String getFilename() { // 파일 이름 리턴
        return filename;
    }

    public int getQuantity() {
	return quantity;
    }

    public void setQuantity(int quantity) {
	    this.quantity = quantity;
    }
}